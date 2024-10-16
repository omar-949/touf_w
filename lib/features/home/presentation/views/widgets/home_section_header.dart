import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class HomeSectionHeader extends StatelessWidget {
  const HomeSectionHeader({
    super.key,
    required this.section,
    this.isSeeAll = false,
    this.onSeeAllPressed,
  });

  final String section;
  final bool? isSeeAll;
  final VoidCallback? onSeeAllPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: Row(
        children: [
          Container(
            height: 28.h,
            width: 5.w,
            decoration: BoxDecoration(
              color: AppColors.orange,
              borderRadius: BorderRadius.circular(12.w),
            ),
          ),
          5.horizontalSpace,
          Text(
            section,
            style: TextStyles.font20BlackMedium,
          ),
          const Spacer(),
          if (isSeeAll == true)
            GestureDetector(
              onTap: onSeeAllPressed,
              child: Text(
                "See all",
                style: TextStyles.font16BlackRegular,
              ),
            ),
        ],
      ),
    );
  }
}
