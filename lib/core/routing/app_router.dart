import 'package:flutter/material.dart';
import 'package:toufwshouf/core/routing/route_animations.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/features/auth/presentation/views/code_validation_view.dart';
import 'package:toufwshouf/features/auth/presentation/views/forget_pass_view.dart';
import 'package:toufwshouf/features/auth/presentation/views/login_view.dart';
import 'package:toufwshouf/features/auth/presentation/views/reset_password_view.dart';
import 'package:toufwshouf/features/auth/presentation/views/sign_up_view.dart';
import 'package:toufwshouf/features/home/presentation/views/home_view.dart';
import 'package:toufwshouf/features/home/presentation/views/see_all_view.dart';
import 'package:toufwshouf/features/onboarding/presentation/views/onboarding_view.dart';

class AppRouter {
  Route<dynamic>? generateRouter(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      // Onboarding
      case Routes.onboardingView:
        return RouteAnimations.buildPageRoute(
          const OnboardingView(),
          settings,
          TransitionType.slideFromRight,
        );
      // Auth
      case Routes.loginView:
        return RouteAnimations.buildPageRoute(
          const LoginView(),
          settings,
          TransitionType.slideFromRight,
        );
      case Routes.forgetPasswordView:
        return RouteAnimations.buildPageRoute(
          const ForgetPasswordView(),
          settings,
          TransitionType.slideFromRight,
        );
      case Routes.codeVerificationView:
        final args = arguments as Map<String, dynamic>?;

        if (args != null &&
            args['email'] is String &&
            args['phone'] is String) {
          final email = args['email'] as String;
          final phone = args['phone'] as String;

          return RouteAnimations.buildPageRoute(
            CodeValidationView(email: email, phone: phone),
            settings,
            TransitionType.slideFromRight,
          );
        }
        break;
      case Routes.signUpView:
        return RouteAnimations.buildPageRoute(
          const SignUpView(),
          settings,
          TransitionType.slideFromBottom,
        );
      case Routes.resetPassView:
        return RouteAnimations.buildPageRoute(
          const ResetPasswordView(),
          settings,
          TransitionType.slideFromLeft,
        );

      // Home
      case Routes.homeView:
        return RouteAnimations.buildPageRoute(
          HomeView(),
          settings,
          TransitionType.slideFromRight,
        );
      case Routes.seeAllView:
        final args = arguments as Map<String, dynamic>?;

        if (args != null &&
            args['title'] is String) {
          final title = args['title'] as String;
          return RouteAnimations.buildPageRoute(
            SeeAllView(title: title),
            settings,
            TransitionType.slideFromRight,
          );
        }
      default:
        return null;
    }
    return null;
  }
}
