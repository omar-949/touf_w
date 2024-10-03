import 'package:flutter/material.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/features/Home/presentation/views/screens/home_screen.dart';
import 'package:toufwshouf/features/auth/presentation/views/screens/codeVerification_screen.dart';
import 'package:toufwshouf/features/auth/presentation/views/screens/forgetPass_screen.dart';
import 'package:toufwshouf/features/auth/presentation/views/screens/login_screen.dart';
import 'package:toufwshouf/features/auth/presentation/views/screens/reset_password_screen.dart';
import 'package:toufwshouf/features/auth/presentation/views/screens/signUp_screen.dart';
import 'package:toufwshouf/features/onboarding/presentation/views/onboarding_view.dart';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
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
