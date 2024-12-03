import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:toufwshouf/features/onboarding/presentation/views/widgets/onboarding_button.dart';

class OnboardingButtonRow extends StatelessWidget {
  const OnboardingButtonRow({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    final currentPage = context.watch<OnboardingCubit>().state;

    void handleNext() {
      if (currentPage < 2) {
        pageController.animateToPage(
          currentPage + 1,
          duration: const Duration(milliseconds: 400),
          curve: Curves.decelerate,
        );
      } else {
        context.pushReplacementNamed(Routes.loginView);
      }
    }

    return Positioned(
      bottom: 40.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OnboardingButton(
            color: AppColors.mediumGrey,
            text: 'Skip',
            onTap: () {
              context.pushReplacementNamed(Routes.loginView);
            },
          ),
          16.horizontalSpace,
          OnboardingButton(
            color: Colors.white,
            text: currentPage < 2 ? 'Next' : 'Finish',
            onTap: handleNext,
          ),
        ],
      ),
    );
  }
}
