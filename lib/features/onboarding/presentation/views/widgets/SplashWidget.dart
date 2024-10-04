import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../core/routing/routes.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _opacity = 1.0;
          _controller.forward();
        });
      });
      Timer(const Duration(seconds: 4), () {
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
            Positioned.fill(
              child: Image.asset(
                "assets/splash_onboarding/Splash Screen.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 216,
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 3),
                child: ScaleTransition(
                  scale: _scaleAnimation,
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
          ],
        ),
      ),
    );
  }
}
