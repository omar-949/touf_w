import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/features/onboarding/presentation/manager/onboarding_cubit.dart';
import 'package:toufwshouf/features/onboarding/presentation/views/widgets/Onboarding_button_row.dart';
import 'package:toufwshouf/features/onboarding/presentation/views/widgets/onboarding_dots_indicator.dart';
import 'package:toufwshouf/features/onboarding/presentation/views/widgets/onboarding_page_view.dart';
import 'package:toufwshouf/features/onboarding/presentation/views/widgets/onboarding_text.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit, int>(
      builder: (context, currentPage) {
        return Stack(
          alignment: Alignment.center,
          children: [
            OnboardingPageView(
              pageController: _pageController,
              onPageChanged: (index) {
                context.read<OnboardingCubit>().setCurrentPage(index);
              },
            ),
            OnboardingText(),
            OnboardingDotsIndicator(currentPage: currentPage),
            OnboardingButtonRow(
              pageController: _pageController,
            ),
          ],
        );
      },
    );
  }
}
