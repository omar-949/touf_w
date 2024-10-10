class OnboardingInfo {
  final String image;
  final String titlePart1;
  final String titlePart2;
  final String description1;
  final String description2;

  OnboardingInfo({
    required this.image,
    required this.titlePart1,
    required this.titlePart2,
    required this.description1,
    required this.description2,
  });
}

final List<OnboardingInfo> contents = [
  OnboardingInfo(
    image: 'assets/splash_onboarding/onboarding1.png',
    titlePart1: 'Embark On Your Simple',
    titlePart2: 'Travel Experience',
    description1: 'Enjoy a Smooth, stress-free travel Journey',
    description2: 'with ease and simplicity every step.',
  ),
  OnboardingInfo(
    image: 'assets/splash_onboarding/onboarding2.png',
    titlePart1: 'Embark On Your Simple',
    titlePart2: 'Travel Experience',
    description1: 'Enjoy a Smooth, stress-free travel Journey',
    description2: 'with ease and simplicity every step.',
  ),
  OnboardingInfo(
    image: 'assets/splash_onboarding/onboarding3.png',
    titlePart1: 'Embark On Your Simple',
    titlePart2: 'Travel Experience',
    description1: 'Enjoy a Smooth, stress-free travel Journey',
    description2: 'with ease and simplicity every step.',
  ),
];
