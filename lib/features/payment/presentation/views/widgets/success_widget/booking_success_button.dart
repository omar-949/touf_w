import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import '../../../../../../core/widgets/custom_button.dart';

class BookingSuccessButton extends StatelessWidget {
  const BookingSuccessButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          text: "Make another booking",
          onPressed: () {
            context.pushNamed(Routes.paymentView);
          },
          borderSideColor: AppColors.orange,
          backgroundColor: AppColors.orange,
          borderRadius: BorderRadius.circular(2.r),
          height: 46.h,
          textStyle: TextStyles.font18WhiteMedium,
        ),
        SizedBox(height: 16.h),
        CustomButton(
          text: "Return home",
          textStyle: TextStyles.font18WhiteMedium.copyWith(
            color: AppColors.orange,
          ),
          onPressed: () {
            context.pushNamed(Routes.homeView);
          },
          borderSideColor: AppColors.orange,
          backgroundColor: Colors.transparent,
          borderRadius: BorderRadius.circular(2.r),
          height: 44.h,
        ),
        SizedBox(height: 50.h),
      ],
    );
  }
}
