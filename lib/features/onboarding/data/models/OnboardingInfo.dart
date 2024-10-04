class OnboardingInfo {
  final String image;
  final String title;
  final String description;

  OnboardingInfo({
    required this.image,
    required this.title,
    required this.description,
  });
}

// Sample contents
final List<OnboardingInfo> contents = [
  OnboardingInfo(
    image: 'assets/splash_onboarding/onboarding1.png',
    title: 'Embark On Your Simple Travel Experience',
    description: 'Enjoy a Smooth, stress-free travel Journey with ease and simplicity every step.',
  ),
  OnboardingInfo(
    image: 'assets/splash_onboarding/onboarding2.png',
    title: 'Embark On Your Simple Travel Experience',
    description: 'Enjoy a Smooth, stress-free travel Journey with ease and simplicity every step.',
  ),
  OnboardingInfo(
    image: 'assets/splash_onboarding/onboarding3.png',
    title: 'Embark On Your Simple Travel Experience',
    description: 'Enjoy a Smooth, stress-free travel Journey with ease and simplicity every step.',
  ),
  // Add more onboarding content as needed
];
