import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/login_widget.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/Header_widget.dart';

import '../../../../../core/resources/styles.dart';

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
              const Header(
                logoAsset: "assets/logo_en 2.png",
                imageAsset: "assets/auth/login.png",
              ),
              SizedBox(height: 10.h),
              Text("Login", style: TextStyles.font26GreyExtraBold),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  "Welcome back! Please enter your details.",
                  style: TextStyles.font14GreyMedium,
                ),
              ),
              SizedBox(height: 10.h),
              const LoginWidget(), // Use the separated login widget here
            ],
          ),
        ),
      ),
    );
  }
}
