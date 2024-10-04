import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/validator.dart';
import 'package:toufwshouf/core/routing/routes.dart';

import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/widgets/CustomTextField.dart';
import '../../../../../../core/widgets/Navigation_link.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'SocialLoginButton.dart'; // Import the SocialLoginButton

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      Navigator.of(context).pushNamed(Routes.homeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 31.w),
      child: Container(
        width: 327.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                hintText: 'Email',
                controller: _emailController,
                validator: Validator.emailValidator,
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomTextField(
                hintText: 'Password',
                isPassword: true,
                controller: _passwordController,
                validator: Validator.loginPasswordValidator,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    side: BorderSide(color: TextColors.grey600),
                    activeColor: Colors.blue,
                    value: _agreeToTerms,
                    onChanged: (value) {
                      setState(() {
                        _agreeToTerms = value ?? false;
                      });
                    },
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 17.h),
                        RichText(
                          text: TextSpan(
                            text: 'Remember information',
                            style: TextStyles.font14Grey600Regular,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              CustomButton(
                text: 'LOGIN',
                onPressed: _login,
              ),
              SizedBox(height: screenHeight * 0.005),
              SizedBox(height: 8.0),
              NavigationLink(
                questionText: "",
                actionText: "Forget password?",
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.forgetpasswordScreen),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    "OR",
                    style: TextStyles.font14Grey600Regular,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.0.h),
              // Use the SocialLoginButton widget here
              SocialLoginButton(
                imagePath: 'assets/auth/google.png',
                text: 'Login with Google',
                onPressed: () {
                  // Add your Google login logic here
                },
              ),
              SizedBox(height: 8.0.h),
              SocialLoginButton(
                imagePath: 'assets/auth/facebook.png',
                text: 'Login with Facebook',
                onPressed: () {
                  // Add your Facebook login logic here
                },
              ),
              SizedBox(height: 8.0.h),
              SocialLoginButton(
                imagePath: 'assets/auth/apple.png',
                text: 'Login with Apple',
                onPressed: () {
                  // Add your Apple login logic here
                },
              ),
              NavigationLink(
                questionText: "First time here?",
                actionText: "Sign up for free",
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.signupScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
