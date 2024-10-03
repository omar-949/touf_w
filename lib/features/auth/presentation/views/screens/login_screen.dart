import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/CustomTextField.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/Header_widget.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/Navigation_link.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/custom_button.dart';

import '../../../../../core/routing/app_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _agreeToTerms = false; // Checkbox state
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {

      Routes.homeScreen;
    }
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
              SizedBox(height: 10.h,),
              Text("Login",style:TextStyles.font26GreyExtraBold),
              SizedBox(height: 10.h,),
              Center(child: Text("Welcome back! Please enter your details.",style:TextStyles.font14GreyMedium)),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal:31.w),
                child: Container(

                  width:327.w,
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
                          validator: _validateEmail,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomTextField(

                          hintText: 'Password',

                          isPassword: true,
                          controller: _passwordController,
                          validator: _validatePassword,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Checkbox(
                              side: BorderSide(
                                color:TextColors.grey600
                              ),
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
                                  SizedBox(height: 17.h,),
                                  RichText(
                                    text: TextSpan(
                                          text: 'Remember information',
                                          style:TextStyles.font14Grey600Regular,

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
                          actionText: "Forget Password?",
                          onPressed: () =>  Navigator.of(context).pushNamed(Routes.forgetpasswordScreen)
                        ),
                        NavigationLink(
                            questionText: "First time here?",
                            actionText: "Sign up for free",
                            onPressed: () =>  Navigator.of(context).pushNamed(Routes.signupScreen)
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.1,)
            ],
          ),
        ),
      ),
    );
  }
}