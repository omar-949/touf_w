import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart'; // Import the country picker package
import 'package:toufwshouf/core/resources/styles.dart';
import '../../../../../core/resources/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPhoneField; // New property to check if this is a phone field

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    this.validator,
    this.isPhoneField = false, // Default to false
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;
  String _countryCode = "+20"; // Default to Egypt
  String _countryFlag = "🇪🇬"; // Default flag for Egypt

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword;
  }

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          _countryCode = country.phoneCode; // Update country code
          _countryFlag = country.flagEmoji; // Update country flag
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.isPhoneField) // Show phone field only if it's a phone field
          Container(
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyles.font14Grey600Regular,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide:  BorderSide(
                    color: TextColors.grey200, // Set border color to red
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: TextColors.grey200, // Set enabled border color to red
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.blue, // Set focused border color to red
                    width: 2.0,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: 12.0,
                ),
                prefixIcon: GestureDetector(
                  onTap: _showCountryPicker,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _countryFlag, // Show country flag
                          style: TextStyle(fontSize: 20), // Customize the flag size
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          _countryCode, // Show country code
                          style: TextStyles.font14Grey600Regular,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              validator: widget.validator,
              cursorColor: Colors.black,
            ),
          ),
        if (!widget.isPhoneField) // Handle other text fields
          Container(
            constraints: const BoxConstraints(
              maxHeight: 70,
            ),
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyles.font14Grey600Regular,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(color: TextColors.grey200), // Set border color to red
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: TextColors.grey200, // Set enabled border color to red
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.blue, // Set focused border color to red
                    width: 2.0,
                  ),
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: 12.0,
                ),
                suffixIcon: widget.isPassword
                    ? IconButton(
                  icon: Icon(
                    _isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });
                  },
                )
                    : null,
              ),
              obscureText: _isObscured,
              validator: widget.validator,
              cursorColor: Colors.black,
            ),
          ),
      ],
    );
  }
}
