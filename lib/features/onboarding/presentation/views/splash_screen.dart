import 'package:flutter/material.dart';
import 'widgets/splash/SplashWidget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SplashWidget(),
      ),
    );
  }
}