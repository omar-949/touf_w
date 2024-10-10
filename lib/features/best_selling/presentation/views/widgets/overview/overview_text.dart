import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class OverviewText extends StatelessWidget {
  final String mainText;
  final String additionalInfo;

  const OverviewText({
    required this.mainText,
    required this.additionalInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mainText,
          style: TextStyles.font16DarkGreyRegular,
        ),
        SizedBox(height: 10.h),
        Text(
          'Additional Info',
          style: TextStyles.font18MediumDarkGreyMedium,
        ),
        SizedBox(height: 10.h),
        Text(
          additionalInfo,
          style: TextStyles.font16DarkGreyRegular,
        ),
        SizedBox(height: 10.h),
      ],
    );
  }
}
