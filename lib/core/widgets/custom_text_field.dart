import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:toufwshouf/core/resources/styles.dart';

import '../resources/colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPhoneField;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    this.validator,
    this.isPhoneField = false,
    this.onChanged,
    this.keyboardType,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
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
          _countryFlag = country.flagEmoji;
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
          _buildPhoneField(screenWidth)
        else
          _buildTextField(screenWidth),
      ],
    );
  }

  Widget _buildPhoneField(double screenWidth) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyles.font14Grey600Regular.copyWith(
          fontFamily: 'Montserrat',
        ),
        border: _buildOutlineBorder(),
        enabledBorder: _buildOutlineBorder(),
        focusedBorder: _buildFocusedBorder(),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: 12.0,
        ),
        prefixIcon: _buildCountryPickerIcon(),
      ),
      validator: (value) {
        return widget.validator!(value);
      },
      cursorColor: Colors.black,
      keyboardType: TextInputType.phone,
      onChanged: widget.onChanged,
    );
  }

  Widget _buildTextField(double screenWidth) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 70),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: _isObscured,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyles.font14Grey600Regular.copyWith(
            fontFamily: 'Montserrat',
          ),
          border: _buildOutlineBorder(),
          enabledBorder: _buildOutlineBorder(),
          focusedBorder: _buildFocusedBorder(),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.04,
            vertical: 12.0,
          ),
          suffixIcon: widget.isPassword ? _buildPasswordToggleIcon() : null,
        ),
        validator: widget.validator,
        cursorColor: Colors.black,
        onChanged: widget.onChanged,
      ),
    );
  }

  OutlineInputBorder _buildOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: TextColors.grey200,
        width: 1.0,
      ),
    );
  }

  OutlineInputBorder _buildFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 2.0,
      ),
    );
  }

  Widget _buildCountryPickerIcon() {
    return GestureDetector(
      onTap: _showCountryPicker,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _countryFlag,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(width: 2),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: Color(0xffB3BECD),
              size: 16,
            ),
            const SizedBox(width: 10),
            Container(
              width: 1,
              height: 30,
              color: const Color(0xffB3BECD),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordToggleIcon() {
    return IconButton(
      icon: Icon(
        _isObscured ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        color: const Color(0xffA0AEC0),
      ),
      onPressed: () {
        setState(() {
          _isObscured = !_isObscured;
        });
      },
    );
  }
}
