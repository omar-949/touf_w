import 'package:flutter/material.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/CustomTextField.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/Header_widget.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/Navigation_link.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/custom_button.dart';
class ResetPasswordWidget extends StatefulWidget {
  const ResetPasswordWidget({super.key});

  @override
  State<ResetPasswordWidget> createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Header(
                logoAsset: "assets/logo_en 2.png",
               imageAsset: "assets/auth/reset_pass.png",
              ),
              Text("Reset password?",style:TextStyles.font26GreyExtraBold),
              SizedBox(height: screenHeight * 0.05), // Consistent gap between logo and form
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Container(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(251, 213, 125, 0.5),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(

                          hintText: 'Enter your email',

                          controller: _emailController,
                          validator: _validateEmail,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        CustomTextField(

                          hintText: 'Enter your password',
                      
                          isPassword: true,
                          controller: _passwordController,
                          validator: _validatePassword,
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: TextButton(
                            onPressed: () => Routes.forgetpasswordScreen,
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontFamily: 'Comfortaa',
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.w300,
                                height: 1.2,
                                letterSpacing: -0.3,
                                color: const Color.fromRGBO(54, 54, 54, 1),
                              ),
                            ),
                          ),
                        ),
                        CustomButton(
                          text: 'LOGIN',
                          onPressed: _login,
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        NavigationLink(
                            questionText: "Don't have an account? ",
                            actionText: "Sign up",
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
