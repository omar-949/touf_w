import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toufwshouf/core/helpers/validator.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/CustomTextField.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/Header_widget.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/Navigation_link.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0), // Add padding to the left
            child: Image.asset(imagePath), // Load images from assets
          ),
          SizedBox(width: 45.w,),
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
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;

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
              Center(child: Text("Welcome back! Please enter your details.", style: TextStyles.font14GreyMedium)),
              SizedBox(height: 10.h),
              Padding(
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
                          onPressed: () => Navigator.of(context).pushNamed(Routes.forgetpasswordScreen),
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
              ),
              SizedBox(height: screenHeight * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
