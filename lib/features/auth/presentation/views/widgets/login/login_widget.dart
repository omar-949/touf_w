import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/core/widgets/header_widget.dart';
import '../../../../../../core/widgets/navigation_link.dart';
import 'login_form.dart';
import 'social_login_button.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  LoginWidgetState createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
  bool _agreeToTerms = false;

  @override
  void dispose() {
    super.dispose();
  }

  void _login() {
    // You can call the _login function in LoginForm via the onLogin callback
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 31.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Header(
            logoAsset: "assets/logo_en 2.png",
            imageAsset: "assets/auth/login.png",
          ),
          SizedBox(height: 10.h),
          Center(child: Text("Login", style: TextStyles.font26GreyExtraBold)),
          SizedBox(height: 10.h),
          Center(
              child: Text("Welcome back! Please enter your details.",
                  style: TextStyles.font14GreyMedium)),
          SizedBox(height: 10.h),
          LoginForm(
            onLogin: _login,
            onCheckboxChanged: (value) {
              setState(() {
                _agreeToTerms = value ?? false;
              });
            },
          ),
          SizedBox(height: 8.0.h),
          const SocialLoginButton(
            imagePath: 'assets/auth/google.png',
            text: 'Login with Google',
          ),
          SizedBox(height: 8.0.h),
          const SocialLoginButton(
            imagePath: 'assets/auth/facebook.png',
            text: 'Login with Facebook',
          ),
          SizedBox(height: 8.0.h),
          const SocialLoginButton(
            imagePath: 'assets/auth/apple.png',
            text: 'Login with Apple',
          ),
          NavigationLink(
            questionText: "First time here?",
            actionText: "Sign up for free",
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.signupScreen),
          ),
        ],
      ),
    );
  }
}
