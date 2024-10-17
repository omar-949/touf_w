import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/assets.dart';
import '../../../../../../core/resources/styles.dart';

class HotelsLocationAndDetailsForContainer extends StatelessWidget {
  const HotelsLocationAndDetailsForContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Image.asset(
            Assets.location,
            height: 22.h,
            width: 15.w,
          ),
          12.horizontalSpace,
          Text.rich(TextSpan(children: [
            TextSpan(
              text: "Cairo",
              style: TextStyles.font16LightGrey600regular,
            ),
            TextSpan(text: "  "),
            TextSpan(
              text: "[ Map ]",
              style: TextStyles.font16darkBlue400Regular,
            )
          ])),
        ],
      ),
      12.verticalSpace,
      Row(children: [
        Image.asset(
          Assets.iconAwesomeBed,
          height: 13.h,
          width: 22.w,
        ),
        12.horizontalSpace,
        Expanded(
            child: Text(
          "Economy double or twin room non-refundable",
          style: TextStyles.font16LightGrey600regular,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ))
      ])
    ]);
  }
}
