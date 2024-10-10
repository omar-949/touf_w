import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';

class ButtonRow extends StatelessWidget {
  final String label;
  final String imagePath;
  final VoidCallback onPressed;

  const ButtonRow({
    super.key,
    required this.label,
    required this.imagePath,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(0, 4),
                  blurRadius: 4,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Center(
              child: IconButton(
                onPressed: onPressed,
                padding: const EdgeInsets.all(5),
                icon: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: 16.w,
                  height: 15.h,
                ),
              ),
            ),
          ),
          SizedBox(width: 5.w),
          Text(
            label,
            style: TextStyles.font16DarkGreyRegular,
          ),
        ],
      ),
    );
  }
}
