import 'package:dio/dio.dart'; // If you're using Dio for HTTP requests
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toufwshouf/core/helpers/validator.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/routing/app_router.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/CustomTextField.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/Header_widget.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/Navigation_link.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:toufwshouf/features/auth/presentation/views/screens/login_screen.dart';

import '../../../../../core/helpers/font_weight_helper.dart'; // Import your LoginScreen

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _emailController.dispose();
    _firstnameController.dispose();
    _lastnameController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _signUp() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (!_agreeToTerms) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You must agree to the terms and conditions.')),
        );
        return; // Return early if terms are not agreed to
      }

      // Proceed with sign-up logic (e.g., API call)
      // Assuming sign-up is successful, navigate to the login screen
      Navigator.of(context).pushNamed(Routes.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
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
                imageAsset: "assets/auth/sign_up.png",
              ),
              Padding(
                padding: EdgeInsets.only(top: 17.h),
                child: Center(child: Text("Sign up", style: TextStyles.font26GreyExtraBold.copyWith(fontFamily: 'Montserrat'))),
              ),
              SizedBox(height: 5.h),
              Center(child: Text("Hello there! Let’s create your account.", style: TextStyles.font14GreyMedium.copyWith(fontFamily: 'Montserrat'))),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
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
                          hintText: 'First Name',
                          controller: _firstnameController,
                          validator: Validator.userNameValidator,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomTextField(
                          hintText: 'Last Name',
                          controller: _lastnameController,
                          validator: Validator.userNameValidator,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomTextField(
                          hintText: 'Email',
                          controller: _emailController,
                          validator: Validator.emailValidator,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomTextField(
                          hintText: 'Phone number',
                          controller: _phoneController,
                          validator: Validator.phoneNumberValidator,
                          isPhoneField: true,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomTextField(
                          hintText: 'Password',
                          isPassword: true,
                          controller: _passwordController,
                          validator: Validator.passwordValidator,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              splashRadius: 30,
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
                                  SizedBox(height: 13.h),
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyles.font14Grey600Regular.copyWith(fontFamily: 'Montserrat'),
                                      children: [
                                        TextSpan(text: 'I agree to the Platform'),
                                        TextSpan(
                                          text: ' Terms of Service',
                                          style: TextStyles.font14Blue500Bold.copyWith(fontFamily: 'Montserrat'),
                                        ),
                                        TextSpan(text: ' and ', style: TextStyles.font14Grey600Regular.copyWith(fontFamily: 'Montserrat')),
                                        TextSpan(
                                          text: 'Privacy Policy',
                                          style: TextStyles.font14Blue500Bold.copyWith(fontFamily: 'Montserrat'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: screenHeight * 0.03),
                        CustomButton(
                          text: 'Create Account',
                          onPressed: _signUp,
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        NavigationLink(
                          questionText: "Joined us before?",
                          actionText: "Login",
                          onPressed: () => Navigator.of(context).pushNamed(Routes.loginScreen),
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
