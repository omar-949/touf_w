import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/styles.dart';

class SocialLoginButton extends StatelessWidget {
  final String imagePath;
  final String text;

  const SocialLoginButton({
    Key? key,
    required this.imagePath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 327.w,
      height: 46.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset(imagePath),
          ),
          SizedBox(width: 45.w),
          Text(
            text,
            style: TextStyles.font14Grey600Regular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
