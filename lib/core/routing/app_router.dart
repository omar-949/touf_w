import 'package:flutter/material.dart';
import 'package:toufwshouf/core/routing/route_animations.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/features/auth/presentation/views/code_verification_screen.dart';
import 'package:toufwshouf/features/auth/presentation/views/forget_pass_screen.dart';
import 'package:toufwshouf/features/best_selling/presentation/views/detail_screen.dart';
import 'package:toufwshouf/features/onboarding/presentation/views/onboarding_view.dart';
import 'package:toufwshouf/features/payment/presentation/views/payment_screen.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/reset_password_screen.dart';
import '../../features/auth/presentation/views/sign_up_screen.dart';
import '../../features/best_selling/presentation/views/best_selling_screen.dart';
import '../../features/home/presentation/views/home_screen.dart';
import '../../features/onboarding/presentation/views/splash_screen.dart';

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
          const LoginView(),
          settings,
          TransitionType.slideFromLeft,
        );
      case Routes.forgetPasswordScreen:
        return RouteAnimations.buildPageRoute(
          const ForgetPasswordScreen(),
          settings,
          TransitionType.slideFromLeft,
        );
      case Routes.codeVerificationScreen:
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
      case Routes.resetPassScreen:
        return RouteAnimations.buildPageRoute(
          const ResetPasswordScreen(),
          settings,
          TransitionType.slideFromLeft,
        );
      case Routes.detailScreen:
        return RouteAnimations.buildPageRoute(
          DetailScreen(),
          settings,
          TransitionType.slideFromLeft,
        );
      case Routes.paymentScreen:
        return MaterialPageRoute(
          builder: (_) => const PaymentScreen(),
        );
      case Routes.bestSellingScreen:
        return MaterialPageRoute(
          builder: (_) => const BestSellingScreen(),
        );

      default:
        return null;
    }
  }
}
