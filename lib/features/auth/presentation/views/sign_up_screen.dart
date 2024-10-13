import 'package:flutter/material.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/signup/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: SignUpBody()),
    );
  }
}
