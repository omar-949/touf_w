import 'package:flutter/material.dart';
import 'package:toufwshouf/features/onboarding/presentation/views/widgets/onboarding/onboarding_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnboardingWidget()
    );
  }
}
