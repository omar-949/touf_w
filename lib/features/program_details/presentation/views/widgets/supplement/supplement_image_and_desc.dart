import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';
class SupplementImageAndDesc extends StatelessWidget {
  const SupplementImageAndDesc({super.key, required this.desc});
  final String desc;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Image.asset("assets/best_selling/Icon ionic-md-checkmark-circle-outline.png",height: 24.h,width: 24.h),
        8.horizontalSpace,
        Text(desc,style: TextStyles.font16DarkGreyRegular)
      ],
    );
  }
}
