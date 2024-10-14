import 'package:flutter/material.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/forget_pass/forget_pass_body.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgetPassBody(),
    );
  }
}
