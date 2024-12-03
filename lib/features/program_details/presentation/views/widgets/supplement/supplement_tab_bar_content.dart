import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/supplement/supplement_list_view.dart';

import '../../../../../../core/resources/colors.dart';

class SupplementTabBarContent extends StatelessWidget {
  const SupplementTabBarContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "The price includes supplement:",
            style: TextStyles.font18darkGreyMedium,
          ),
          16.verticalSpace,
          const SupplementListView(),
          const Divider(
            color: TextColors.lightGrey,
          ),
          12.verticalSpace,
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
