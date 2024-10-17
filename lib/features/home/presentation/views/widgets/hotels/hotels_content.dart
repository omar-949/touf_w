import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/hotels/hotels_list_view.dart';

import '../../../../../../core/resources/styles.dart';

class HotelsContent extends StatelessWidget {
  const HotelsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.0.h),
      child: Column(
        children: [
          Text.rich(TextSpan(children: [
            TextSpan(text: 'Search Result', style: TextStyles.font18darkGreyMedium),
            TextSpan(text: '(50 Hotels)', style: TextStyles.font16darkGreyMedium)
          ])),
          16.verticalSpace,
          Expanded(child: HotelsListView())
        ],
      ),
    );
  }
}
