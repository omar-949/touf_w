import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../../core/resources/assets.dart';
import '../../../../../../core/routing/routes.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds:5),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );

    _backgroundOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    // Start the animations
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.forward();
      Timer(const Duration(seconds:6), () {
        Navigator.pushReplacementNamed(context, Routes.onboardingScreen);
      });
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
            // Background image with fade transition
            Positioned.fill(
              child: FadeTransition(
                opacity: _backgroundOpacityAnimation,
                child: Image.asset(
                  Assets.splashBackgroundImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Logo and animations
            Positioned(
              top: 216,
              left: 0,
              right: 0,
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: SlideTransition(
                  position: Tween<Offset>(begin: const Offset(0, -1), end: const Offset(0, 0)).animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: Curves.easeOut,
                    ),
                  ),
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: RotationTransition(
                      turns: _rotationAnimation,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 87),
                        child: Image.asset(
                          Assets.splashLogoImage,
                          width: 217,
                          height: 105,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
