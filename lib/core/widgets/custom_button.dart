// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:toufwshouf/core/resources/styles.dart';
// class CustomButton extends StatelessWidget {
//   const CustomButton({super.key, this.onPressed, required this.text, required this.backGroundColor, required this.textColor,});
//   final void Function()? onPressed;
//   final String text;
//   final Color backGroundColor;
//   final Color textColor;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 358.w,
//       height: 44.h,
//       child: ElevatedButton(
//         onPressed:onPressed,
//         style: ElevatedButton.styleFrom(
//           backgroundColor:backGroundColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(12.r)),
//             side: const BorderSide(color: Colors.orange, width: 1.0),
//           ),
//           elevation: 0,
//         ),
//         child: Text(text,
//             style: TextStyles.font18OrangeMedium.copyWith(color: textColor)),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors.dart';
import '../resources/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.borderRadius,
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.textStyle,
    this.height,
    // this.shadow = false,
    this.width, this.borderSideColor, // Default to false
  });

  final String text;
  final BorderRadius? borderRadius;
  final Function()? onPressed;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? height;
  // final bool shadow;
  final double? width;
  final Color? borderSideColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?.h,
      width: width?.w,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color:borderSideColor??Colors.white,
          ),
          borderRadius: borderRadius ?? BorderRadius.circular(10.r),
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor ?? AppColors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(4.r),
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: textStyle ??
                  TextStyles.font18WhiteMedium,

            ),
          ),
        ),
      ),
    );
  }
}
