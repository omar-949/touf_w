import 'package:flutter/material.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/signup/sign_up_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpBody(),
    );
  }
}
