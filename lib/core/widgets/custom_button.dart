import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.text, required this.backGroundColor, required this.textColor,});
  final void Function()? onPressed;
  final String text;
  final Color backGroundColor;
  final Color textColor;



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 358.w,
      height: 44.h,
      child: ElevatedButton(
        onPressed:onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:backGroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
            side: const BorderSide(color: Colors.orange, width: 1.0),
          ),
          elevation: 0,
        ),
        child: Text(text,
            style: TextStyles.font18OrangeMedium.copyWith(color: textColor)),
      ),
    );
  }
}
