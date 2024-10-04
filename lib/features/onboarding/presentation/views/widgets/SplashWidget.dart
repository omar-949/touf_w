import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../core/routing/routes.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<double> _backgroundOpacityAnimation;

  final Duration splashDuration = const Duration(seconds: 4);
  final Duration animationDuration = const Duration(seconds: 7);

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _startSplashScreenTimer();
  }

  void _initializeAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: animationDuration,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
    _backgroundOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
    });
  }

  void _startSplashScreenTimer() {
    Timer(splashDuration, () {
      Navigator.pushReplacementNamed(context, Routes.onboardingScreen);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            _buildBackgroundImage(),
            _buildLogo(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: FadeTransition(
        opacity: _backgroundOpacityAnimation,
        child: Image.asset(
          "assets/splash_onboarding/Splash Screen.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Positioned(
      top: 216,
      left: 0,
      right: 0,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero).animate(
            CurvedAnimation(
              parent: _controller,
              curve: Curves.easeInOut,
            ),
          ),
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: RotationTransition(
              turns: _rotationAnimation,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 87),
                child: Image.asset(
                  "assets/splash_onboarding/logo_en 2 (1).png",
                  width: 217,
                  height: 105,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
