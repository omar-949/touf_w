import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/login/login_form.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/login/login_widget.dart';

import '../../../../core/resources/styles.dart';
import '../../../../core/widgets/header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const LoginWidget(), // Use the LoginForm widget here
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
