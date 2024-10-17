import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';

import '../../../../../core/resources/styles.dart';
class CustomCounterWidget extends StatelessWidget {
  const CustomCounterWidget({super.key, required this.count, required this.onAdd, required this.onRemove});
  final int count;
  final Function() onAdd;
  final Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return   Stack(
      children: [
        Positioned(
          left: 10.w,
          top: 1.h,
          child: Container(
            width: 60.w,
            height: 28.h,
            color: TextColors.lightgrey,
          ),
        ),
        Row(
          children: [
            // Minus Button
            Container(
              width: 29.w,
              height: 30.h,
              decoration: const BoxDecoration(
                color: TextColors.darkBlue,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.remove, color: Colors.white, size: 18.sp),
                onPressed: onRemove,
                padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              '$count',
              style: TextStyles.font14LightGreyMedium,
            ),
            SizedBox(width: 8.w),
            // Plus Button
            Container(
              width: 29.w,
              height: 30.h,
              decoration: const BoxDecoration(
                color: TextColors.darkBlue,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.white, size: 18.sp),
                  onPressed: onAdd,
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}