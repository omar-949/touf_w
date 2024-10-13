import 'package:flutter/material.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/login/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LoginBody()
      ),
    );
  }
}
