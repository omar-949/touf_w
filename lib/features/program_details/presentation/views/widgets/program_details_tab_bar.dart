import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';

class ProgramDetailsTabBar extends StatelessWidget {
  const ProgramDetailsTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: TabBar(
        isScrollable: true,
        indicatorColor: AppColors.orange,
        labelColor: AppColors.orange,
        unselectedLabelColor: AppColors.mediumGrey,
        dividerColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        tabAlignment: TabAlignment.center,
        labelStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
        labelPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        physics: const NeverScrollableScrollPhysics(),
        tabs: [
          const Center(child: Text('Overview')),
          const Center(child: Text('Supplement')),
          const Center(child: Text('Photo Gallery')),
        ],
      ),
    );
  }
}
