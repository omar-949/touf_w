import 'package:flutter/material.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/features/Home/presentation/views/screens/home_screen.dart';
import 'package:toufwshouf/features/auth/presentation/views/codeVerification_screen.dart';
import 'package:toufwshouf/features/auth/presentation/views/forgetPass_screen.dart';
import 'package:toufwshouf/features/onboarding/presentation/views/onboarding_view.dart';

import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/auth/presentation/views/reset_password_screen.dart';
import '../../features/auth/presentation/views/signUp_screen.dart';
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
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.forgetpasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const Forget_password_screen(),
        );
      case Routes.codeverificationScreen:
        return MaterialPageRoute(
          builder: (_) =>  VerifyPasswordScreen(),
        );
      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.resetpassScreen:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
        );
      default:
        return null;
    }
  }
}
