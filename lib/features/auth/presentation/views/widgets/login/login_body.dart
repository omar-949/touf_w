import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/widgets/header_widget.dart';
import 'login_form.dart';
class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Header(
            logoAsset: "assets/logo_en 2.png",
            imageAsset: "assets/auth/login.png",
          ),
          SizedBox(height: 10.h),
          Text("Login", style: TextStyles.font26GreyExtraBold),
          SizedBox(height: 10.h),
          Center(
              child: Text("Welcome back! Please enter your details.",
                  style: TextStyles.font14GreyMedium)),
          SizedBox(height: 10.h),
          const LoginForm(), // Use the LoginForm widget here
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
