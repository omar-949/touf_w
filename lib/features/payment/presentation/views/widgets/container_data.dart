import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class ContainerDate extends StatelessWidget {
  final String iconPath;
  final String label;
  final String date;

  const ContainerDate({
    super.key,
    required this.iconPath,
    required this.label,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 6,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(iconPath, width: 24.w, height: 24.h),
          SizedBox(width: 16.w),
          Text(
            label,
            style: TextStyles.font16Grey500Medium,
          ),
          SizedBox(width: 4.w),
          Text(
            date,
            style: TextStyles.font16darkGreyMedium,
          ),
        ],
      ),
    );
  }
}
