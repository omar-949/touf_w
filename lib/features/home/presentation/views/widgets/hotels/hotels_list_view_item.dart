import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/hotels/hotels_container_details.dart';

import '../../../../../../core/resources/colors.dart';

class HotelsListViewItem extends StatelessWidget {
  const HotelsListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.0.h),
      child: Container(
        width: 358.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: Colors.white,
            border: Border.all(color: TextColors.lightGrey2)),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: HotelsContainerDetails(),
      ),
    );
  }
}
