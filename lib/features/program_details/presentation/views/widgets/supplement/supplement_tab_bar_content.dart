import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/supplement/supplement_image_and_desc.dart';

import '../../../../../../core/resources/colors.dart';

class SupplementTabBarContent extends StatelessWidget {
  const SupplementTabBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 24.0.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "The price includes supplement:",
            style: TextStyles.font18darkGreyMedium,
          ),
          16.verticalSpace,
          const SupplementImageAndDesc(desc: "12 working hours Hyundai H1 car"),
          16.verticalSpace,
          Text(
            "1290 EGP",
            style: TextStyles.font18darkBlueSemiBold,
          ),
          16.verticalSpace,
          const SupplementImageAndDesc(desc: "12 working hours Kia Carens"),
          16.verticalSpace,
          Text(
            "1150 EGP",
            style: TextStyles.font18darkBlueSemiBold,
          ),
          16.verticalSpace,
          const SupplementImageAndDesc(desc: "6 working hours Kia Carens"),
          16.verticalSpace,
          Text(
            "780 EGP",
            style: TextStyles.font18darkBlueSemiBold,
          ),
          16.verticalSpace,
          const SupplementImageAndDesc(
              desc: "6 working hours of Hyundai H1 car"),
          16.verticalSpace,
          Text(
            "860 EGP",
            style: TextStyles.font18darkBlueSemiBold,
          ),
          24.verticalSpace,
          const Divider(
            color: TextColors.lightGrey,
          ),
          24.verticalSpace,
          Row(
            children: [
              Image.asset("assets/best_selling/Icon ionic-ios-information-circle-outline.png"),
              16.horizontalSpace,
              Text(
                "All prices don't include VAT",
                style: TextStyles.font18OrangeMedium,
              )
            ],
          )
        ],
      ),
    );
  }
}
