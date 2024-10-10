import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';

class OtpDigitField extends StatefulWidget {
  final FocusNode currentFocus;
  final FocusNode? nextFocus;
  final double fieldWidth;

  const OtpDigitField({
    super.key,
    required this.currentFocus,
    this.nextFocus,
    required this.fieldWidth,
  });

  @override
  OtpDigitFieldState createState() => OtpDigitFieldState();
}

class OtpDigitFieldState extends State<OtpDigitField> {
  String _inputValue = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54.w,
      height: 54.h,
      margin: EdgeInsets.symmetric(horizontal: widget.fieldWidth * 0.3),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          TextFormField(
            focusNode: widget.currentFocus,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: widget.fieldWidth * 0.6,
              height: 1.5,
            ),
            keyboardType: TextInputType.number,
            maxLength: 1,
            cursorColor: TextColors.grey200,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide:
                    const BorderSide(color: TextColors.grey200, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide:
                    const BorderSide(color: TextColors.grey200, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(color: Colors.blue, width: 1),
              ),
              contentPadding: const EdgeInsets.only(bottom: 8),
              counterText: '',
            ),
            controller: TextEditingController(text: _inputValue)
              ..selection = TextSelection.fromPosition(
                  TextPosition(offset: _inputValue.length)),
            onChanged: (value) {
              if (value.length <= 1) {
                setState(() {
                  _inputValue = value;
                });
                if (value.length == 1 && widget.nextFocus != null) {
                  FocusScope.of(context).requestFocus(widget.nextFocus);
                }
              }
            },
          ),
          Positioned(
            bottom: 0,
            child: Opacity(
              opacity: _inputValue.isEmpty ? 1.0 : 0.0,
              child: Text(
                '-',
                style: TextStyle(
                  color: TextColors.grey500.withOpacity(0.5),
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
