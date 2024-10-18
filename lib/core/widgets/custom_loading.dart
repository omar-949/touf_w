import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100.w,
        height: 100.h,
        decoration: BoxDecoration(
            color: AppColors.background.withOpacity(0.7),
            borderRadius: BorderRadius.circular(20.w)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: AppColors.blue500,
            ),
            10.verticalSpace,
            Text(
              "Loading...",
              style: TextStyles.font14Blue500Medium,
            )
          ],
        ),
      ),
    );
  }
}
