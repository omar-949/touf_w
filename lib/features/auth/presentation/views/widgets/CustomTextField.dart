import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
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
          _countryFlag = country.flagEmoji; // Update country flag only
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
        if (widget.isPhoneField)
          Container(
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyles.font14Grey600Regular.copyWith(fontFamily: 'Montserrat'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  borderSide: const BorderSide(
                    color: TextColors.grey200,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
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
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _countryFlag,
                          style: const TextStyle(fontSize: 20), // Customize the flag size
                        ),
                        const SizedBox(width: 2),
                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Color(0xffB3BECD),
                          size: 16,
                        ),
                        const SizedBox(width: 10),
                        Container(
                          width: 1, // Fixed width for divider
                          height: 30, // Customize the height of the divider
                          color: Color(0xffB3BECD), // Divider color
                        ),// Dropdown icon
                      ],
                    ),
                  ),
                ),
              ),
              validator: widget.validator,
              cursorColor: Colors.black,
              keyboardType: TextInputType.phone,
            ),
          ),
        if (!widget.isPhoneField)
          Container(
            constraints: const BoxConstraints(
              maxHeight: 70,
            ),
            child: TextFormField(
              controller: widget.controller,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyles.font14Grey600Regular.copyWith(fontFamily: 'Montserrat'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: TextColors.grey200,
                    width: 1.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.blue,
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
                    color: Color(0xffA0AEC0),
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
