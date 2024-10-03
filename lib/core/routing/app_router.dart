import 'package:flutter/material.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/features/onboarding/presentation/views/onboarding_view.dart';

import '../../features/onboarding/presentation/views/SplashScreen.dart';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen: // Add splash screen route
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.onboardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingView(),
        );
      default:
        return null;
    }
  }
}
