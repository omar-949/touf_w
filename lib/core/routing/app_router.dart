import 'package:flutter/material.dart';
import 'package:toufwshouf/core/routing/route_animations.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/features/Home/presentation/views/screens/home_screen.dart';
import 'package:toufwshouf/features/auth/presentation/views/codeVerification_screen.dart';
import 'package:toufwshouf/features/auth/presentation/views/forgetPass_screen.dart';
import 'package:toufwshouf/features/best_selling/presentation/views/DetailScreen.dart';
import 'package:toufwshouf/features/onboarding/presentation/views/onboarding_view.dart';

import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/auth/presentation/views/reset_password_screen.dart';
import '../../features/auth/presentation/views/signUp_screen.dart';
import '../../features/onboarding/presentation/views/SplashScreen.dart';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.splashScreen:
        return RouteAnimations.buildPageRoute(
          const SplashScreen(),
          settings,
          TransitionType.none,
        );
      case Routes.onboardingScreen:
        return RouteAnimations.buildPageRoute(
          const OnboardingView(),
          settings,
          TransitionType.slideFromRight,
        );
      case Routes.loginScreen:
        return RouteAnimations.buildPageRoute(
          const LoginScreen(),
          settings,
          TransitionType.slideFromLeft,
        );
      case Routes.forgetpasswordScreen:
        return RouteAnimations.buildPageRoute(
          const Forget_password_screen(),
          settings,
          TransitionType.slideFromBottom,
        );
      case Routes.codeverificationScreen:
        return RouteAnimations.buildPageRoute(
          const VerifyPasswordScreen(),
          settings,
          TransitionType.slideFromBottom,
        );
      case Routes.signupScreen:
        return RouteAnimations.buildPageRoute(
          const SignUpScreen(),
          settings,
          TransitionType.slideFromRight,
        );
      case Routes.homeScreen:
        return RouteAnimations.buildPageRoute(
          const HomeScreen(),
          settings,
          TransitionType.slideFromBottom,
        );
      case Routes.resetpassScreen:
        return RouteAnimations.buildPageRoute(
          const ResetPasswordScreen(),
          settings,
          TransitionType.slideFromBottom,
        );
      case Routes.datailScreen:
        return RouteAnimations.buildPageRoute(
          const DetailScreen(),
          settings,
          TransitionType.slideFromLeft,
        );
      default:
        return null;
    }
  }
}
