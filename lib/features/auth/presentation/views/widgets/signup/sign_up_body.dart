import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/signup/sign_up_form.dart';

import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widgets/header_widget.dart';
class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
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
          const SnackBar(
              content: Text('You must agree to the terms and conditions.')),
        );
        return;
      }
      Navigator.of(context).pushNamed(Routes.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Header(
            logoAsset: "assets/logo_en 2.png",
            imageAsset: "assets/auth/sign_up.png",
          ),
          Padding(
            padding: EdgeInsets.only(top: 17.h),
            child: Center(
              child: Text(
                "Sign up",
                style: TextStyles.font26GreyExtraBold
                    .copyWith(fontFamily: 'Montserrat'),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Center(
            child: Text(
              "Hello there! Let’s create your account.",
              style: TextStyles.font14GreyMedium
                  .copyWith(fontFamily: 'Montserrat'),
            ),
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: SignUpForm(
              formKey: _formKey,
              emailController: _emailController,
              firstnameController: _firstnameController,
              lastnameController: _lastnameController,
              passwordController: _passwordController,
              phoneController: _phoneController,
              agreeToTerms: _agreeToTerms,
              onAgreeToTermsChanged: (value) {
                setState(() {
                  _agreeToTerms = value ?? false;
                });
              },
              onSignUp: _signUp,
            ),
          ),
          SizedBox(height: screenHeight * 0.1),
        ],
      ),
    );
  }
}
