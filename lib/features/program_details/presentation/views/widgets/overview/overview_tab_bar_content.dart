import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/program_details/presentation/manager/program_details_cubit.dart';

import '../../../../../../core/widgets/custom_loading.dart';

class OverviewTabBarContent extends StatelessWidget {
  const OverviewTabBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          context.read<ProgramDetailsCubit>().productDetails != null &&
                  context.read<ProgramDetailsCubit>().productDetails!.isNotEmpty
              ? Text(
                  context.read<ProgramDetailsCubit>().productDetails![0].overView ?? '',
                  style: TextStyles.font16BlackRegular,
                )
              : const CustomLoading(),

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
