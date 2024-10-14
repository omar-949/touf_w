import 'package:flutter/material.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/forget_pass/forget_pass_body.dart';

class VerifyPasswordScreen extends StatelessWidget {
  const VerifyPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgetPassBody(),
    );
  }
}
