import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../core/routing/routes.dart'; // Ensure that this imports the correct routing

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    // Delay animation and set opacity to 1 after a delay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 300), () {
        setState(() {
          _opacity = 1.0; // Animate opacity
        });
      });

      // Navigate to the next screen after 3 seconds
      Timer(const Duration(seconds: 4), () {
        Navigator.pushReplacementNamed(context, Routes.onboardingScreen);
      });
    });
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
            // Centered logo with opacity animation
            Positioned(
              top: 216,
              child: AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(seconds: 3), // Smoother animation duration
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 87), // Adjust padding
                  child: Image.asset(
                    "assets/splash_onboarding/logo_en 2.png",
                    width: 217,  // Static height value for now
                    height: 105,   // Static width value for now
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
