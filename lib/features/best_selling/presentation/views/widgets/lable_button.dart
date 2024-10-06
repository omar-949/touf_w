import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';

class LableButton extends StatelessWidget {
  final String label;
  final String imagePath; // Accept image path as parameter
  final VoidCallback onPressed;

  const LableButton({
    Key? key,
    required this.label,
    required this.imagePath, // Required image path
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 30.w,  // Increased width
            height: 30.h,  // Increased height
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
                padding: EdgeInsets.all(5),  // Remove default padding
                icon: Image.asset(
                  imagePath, // Use the provided image path
                  fit: BoxFit.cover,
                  width: 16.w,  // Adjust icon size here
                  height: 15.h,  // Adjust icon size here
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
