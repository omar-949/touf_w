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
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
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
        ],
      ),
    );
  }
}
