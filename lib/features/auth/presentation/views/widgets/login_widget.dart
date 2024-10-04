import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/validator.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/Navigation_link.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';

import '../../../../../core/resources/colors.dart';
import '../../../../../core/resources/styles.dart';
import '../../../../../core/widgets/CustomTextField.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  LoginWidgetState createState() => LoginWidgetState();
}

class LoginWidgetState extends State<LoginWidget> {
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

  Widget _socialLoginButton(String imagePath, String text) {
    return Container(
      width: 327.w,
      height: 46.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.0),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Image.asset(imagePath),
          ),
          SizedBox(width: 45.w),
          Text(
            text,
            style: TextStyles.font14Grey600Regular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

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
              NavigationLink(
                questionText: "",
                actionText: "Forget password?",
                onPressed: () => Navigator.of(context).pushNamed(Routes.forgetpasswordScreen),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(color: Colors.grey, thickness: 1),
                  ),
                  SizedBox(width: 8.0),
                  Text("OR", style: TextStyles.font14Grey600Regular),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Divider(color: Colors.grey, thickness: 1),
                  ),
                ],
              ),
              SizedBox(height: 8.0.h),
              _socialLoginButton('assets/auth/google.png', 'Login with Google'),
              SizedBox(height: 8.0.h),
              _socialLoginButton('assets/auth/facebook.png', 'Login with Facebook'),
              SizedBox(height: 8.0.h),
              _socialLoginButton('assets/auth/apple.png', 'Login with Apple'),
              NavigationLink(
                questionText: "First time here?",
                actionText: "Sign up for free",
                onPressed: () => Navigator.of(context).pushNamed(Routes.signupScreen),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
