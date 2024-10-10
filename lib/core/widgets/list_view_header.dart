import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAllPressed;

  const SectionHeader({
    super.key,
    required this.title,
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0.w, bottom: 15.w, top: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 5.w,
                height: 26.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                  color: Colors.orange,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                title,
                style: TextStyles.font20BlackMedium
              ),
            ],
          ),
          if (onSeeAllPressed != null)
            InkWell(
              onTap: onSeeAllPressed,
              child: Text(
                "See all",
                style: TextStyles.font16BlackRegular
              ),
            ),
        ],
      ),
    );
  }
}
