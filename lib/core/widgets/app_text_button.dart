import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.backgroundColor});

  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.w),
        ),
        elevation: 0,
        backgroundColor: backgroundColor ?? AppColors.blue500,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size(double.infinity, 46.h),
      ),
      child: Text(
        text,
        style: TextStyles.font16WhiteMedium,
      ),
    );
  }
}
