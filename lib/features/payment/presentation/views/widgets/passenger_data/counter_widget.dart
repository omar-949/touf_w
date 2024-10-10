import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class CounterWidget extends StatelessWidget {
  final String label;
  final String priceInfo;
  final int count;
  final VoidCallback increment;
  final VoidCallback decrement;

  const CounterWidget({
    required this.label,
    required this.priceInfo,
    required this.count,
    required this.increment,
    required this.decrement,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: TextStyles.font16darkGreyMedium),
              Text(priceInfo, style: TextStyles.font14darkBlue500Medium),
            ],
          ),
        ),
        Stack(
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
                    onPressed: decrement,
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
                      onPressed: increment,
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
