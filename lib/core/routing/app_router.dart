import 'package:flutter/material.dart';
import 'package:toufwshouf/core/routing/route_animations.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/features/auth/presentation/views/codeVerification_screen.dart';
import 'package:toufwshouf/features/auth/presentation/views/forgetPass_screen.dart';
import 'package:toufwshouf/features/best_selling/presentation/views/DetailScreen.dart';
import 'package:toufwshouf/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:toufwshouf/features/payment/presentation/views/payment_screen.dart';

import '../../features/auth/presentation/views/login_screen.dart';
import '../../features/auth/presentation/views/reset_password_screen.dart';
import '../../features/auth/presentation/views/signUp_screen.dart';
import '../../features/best_selling/presentation/views/BestSellingScreen.dart';
import '../../features/home/presentation/views/home_screen.dart';
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
          TransitionType.slideFromLeft,
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
          TransitionType.slideFromLeft,
        );
      case Routes.codeverificationScreen:
        return RouteAnimations.buildPageRoute(
          const VerifyPasswordScreen(),
          settings,
          TransitionType.slideFromLeft,
        );
      case Routes.signupScreen:
        return RouteAnimations.buildPageRoute(
          const SignUpScreen(),
          settings,
          TransitionType.slideFromLeft,
        );
      case Routes.homeScreen:
        return RouteAnimations.buildPageRoute(
          const HomeScreen(),
          settings,
          TransitionType.slideFromLeft,
        );
      case Routes.resetpassScreen:
        return RouteAnimations.buildPageRoute(
          const ResetPasswordScreen(),
          settings,
          TransitionType.slideFromLeft,
        );
      case Routes.datailScreen:
        return RouteAnimations.buildPageRoute(
          DetailScreen(),
          settings,
          TransitionType.slideFromLeft,
        );
      case Routes.paymentScreen:
        return MaterialPageRoute(
          builder: (_) => const PaymentScreen(),
        );
      case Routes.BestSellingScreen:
        return MaterialPageRoute(
          builder: (_) => const BestSellingScreen(),
        );

      default:
        return null;
    }
  }
}
