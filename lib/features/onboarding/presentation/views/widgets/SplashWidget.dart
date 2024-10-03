import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../core/routing/routes.dart'; // Ensure correct routing import

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

    // Initialize the animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3), // Duration for scale animation
    );

    // Define the scale animation to zoom in the logo
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    // Start the opacity and scale animations after a slight delay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _opacity = 1.0; // Trigger the opacity animation
          _controller.forward(); // Start the scale animation
        });
      });

      // Navigate to the next screen after 4 seconds
      Timer(const Duration(seconds: 4), () {
        Navigator.pushReplacementNamed(context, Routes.onboardingScreen);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller to avoid memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Background image
            Positioned.fill(
              child: Image.asset(
                "assets/splash_onboarding/Splash Screen.png",
                fit: BoxFit.cover,
              ),
            ),
            // Centered logo with opacity and scale animations
            Positioned(
              top: 216,
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 3), // Smoother fade-in animation
                child: ScaleTransition(
                  scale: _scaleAnimation, // Apply the scale animation
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 87), // Adjust padding
                    child: Image.asset(
                      "assets/splash_onboarding/logo_en 2 (1).png",
                      width: 217,  // Static width for consistent appearance
                      height: 105, // Static height
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
