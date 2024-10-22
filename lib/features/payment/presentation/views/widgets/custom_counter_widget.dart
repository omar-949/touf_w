import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';

import '../../../../../core/resources/styles.dart';

class CustomCounterWidget extends StatelessWidget {
  const CustomCounterWidget(
      {super.key,
      required this.count,
      required this.onAdd,
      required this.onRemove});

  final int count;
  final Function() onAdd;
  final Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TextColors.lightgrey,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onRemove,
            child: Container(
              width: 30.r,
              height: 30.r,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: TextColors.darkBlue,
              ),
              child: Center(
                child: Icon(Icons.remove, color: Colors.white, size: 18.sp),
              ),
            ),
          ),
          12.horizontalSpace,
          Text(
            '$count',
            style: TextStyles.font14LightGreyMedium,
          ),
          12.horizontalSpace,
          GestureDetector(
            onTap: onAdd,
            child: Container(
              width: 30.r,
              height: 30.r,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: TextColors.darkBlue,
              ),
              child: Icon(Icons.add, color: Colors.white, size: 18.sp),
            ),
          ),
        ],
      ),
    );
  }
}
