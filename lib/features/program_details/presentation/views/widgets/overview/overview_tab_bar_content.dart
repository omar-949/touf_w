import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/program_details/data/models/details_active_program_model/details_active_program_model.dart';

class OverviewTabBarContent extends StatelessWidget {
  const OverviewTabBarContent({super.key, required this.detailsActiveProgramModel});
  final DetailsActiveProgramModel detailsActiveProgramModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            detailsActiveProgramModel.overView ?? '',
            style: TextStyles.font16BlackRegular,
          ),
          // 16.verticalSpace,
          // Text(
          //   'Additional Info',
          //   style: TextStyles.font18MediumDarkGreyMedium,
          // ),
          // 8.verticalSpace,
          // Text(
          //   'Return Details Returns to original departure point Departure Point 77 Salah Salem, Al Omraneyah Ash Sharqeyah, Giza District, Giza Governorate, Egypt As per requested time our tour guide will be waiting in the lobby of your hotel and he will be holding a sign showing your name on it',
          //   style: TextStyles.font16BlackRegular,
          // ),
        ],
      ),
    );
  }
}
