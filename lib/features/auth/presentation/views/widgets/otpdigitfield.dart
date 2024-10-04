import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
class OtpDigitField extends StatefulWidget {
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  final double fieldWidth;

  const OtpDigitField({
    Key? key,
    required this.currentFocus,
    this.nextFocus,
    required this.fieldWidth,
  }) : super(key: key);

  @override
  _OtpDigitFieldState createState() => _OtpDigitFieldState();
}

class _OtpDigitFieldState extends State<OtpDigitField> {
  String _inputValue = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54.w, // Set fixed width for the container
      height: 54.h, // Set the height for the container
      margin: EdgeInsets.symmetric(horizontal: widget.fieldWidth * 0.3),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Actual TextFormField
          TextFormField(
            focusNode: widget.currentFocus,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: widget.fieldWidth * 0.6),
            keyboardType: TextInputType.number,
            maxLength: 1,
            cursorColor: TextColors.grey200, // Set cursor color to grey
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: TextColors.grey200, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: TextColors.grey200, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide(color: Colors.blue, width: 1),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 20), // Adjust vertical padding
              counterText: '', // Remove the 0/1 count
            ),
            onChanged: (value) {
              setState(() {
                _inputValue = value; // Store the input value
              });
              if (value.length == 1 && widget.nextFocus != null) {
                FocusScope.of(context).requestFocus(widget.nextFocus);
              }
            },
          ),
          // Hint text positioned at the bottom
          Positioned(
            bottom: 0, // Adjust this value for vertical positioning
            child: Opacity(
              opacity: _inputValue.isEmpty ? 1.0 : 0.0, // Hide when there's input
              child: Text(
                '-', // Your hint text
                style: TextStyle(
                  color: TextColors.grey500.withOpacity(0.5), // Optional: semi-transparent color
                  fontWeight: FontWeight.w400,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

