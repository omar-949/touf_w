import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/resources/assets.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/home_section_header.dart';

class Advertisements extends StatelessWidget {
  const Advertisements({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeSectionHeader(
          section: "Advertisements",
        ),
        10.verticalSpace,
        Padding(
          padding: EdgeInsets.only(right: 4.w),
          child: Container(
            width: 358.w,
            height: 132.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.advertisement),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Planning a vacation?',
                  style: TextStyles.font20WhiteMedium,
                ),
                5.verticalSpace,
                Text(
                  'Choose your holiday packages.',
                  style: TextStyles.font18WhiteRegular,
                ),
                5.verticalSpace,
                GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(6.w),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                      child: Text(
                        'Book',
                        style: TextStyles.font18WhiteRegular,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
