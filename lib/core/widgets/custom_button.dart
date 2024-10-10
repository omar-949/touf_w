import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor; // Background color parameter
  final double width; // Width parameter
  final double? height; // Width parameter
  final double? radius; // Width parameter

  final TextStyle? textStyle;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF1B85F3), // Default color
    this.width = 327,
    this.height,
    this.textStyle,
    this.radius, // Default width
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w, // Use the provided width
      height: height ?? 46.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Use the provided color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 14.r),
            ),
          ),
          // padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w),
          elevation: 0,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: textStyle ??
              TextStyles.font16WhiteMedium.copyWith(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
