import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      height: 46.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1B85F3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.r), // Rounded top-left corner
              // Square top-right corner
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 10.w), // Padding
          elevation: 0, // No shadow to simulate opacity effect
        ),
        child: Text(
          text,
          style: TextStyles.font16WhiteMedium
          ),
        ),
    );
  }
}