import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/validator.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';
import 'package:toufwshouf/core/widgets/custom_text_field.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widgets/Navigation_link.dart';

class SignUpForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController firstnameController;
  final TextEditingController lastnameController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  final bool agreeToTerms;
  final Function(bool?) onAgreeToTermsChanged;
  final Function() onSignUp;

  const SignUpForm({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.firstnameController,
    required this.lastnameController,
    required this.passwordController,
    required this.phoneController,
    required this.agreeToTerms,
    required this.onAgreeToTermsChanged,
    required this.onSignUp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: 327.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              hintText: 'First Name',
              controller: firstnameController,
              validator: Validator.userNameValidator,
            ),
            SizedBox(height: screenHeight * 0.02),
            CustomTextField(
              hintText: 'Last Name',
              controller: lastnameController,
              validator: Validator.userNameValidator,
            ),
            SizedBox(height: screenHeight * 0.02),
            CustomTextField(
              hintText: 'Email',
              controller: emailController,
              validator: Validator.emailValidator,
            ),
            SizedBox(height: screenHeight * 0.02),
            CustomTextField(
              hintText: 'Phone number',
              controller: phoneController,
              validator: Validator.phoneNumberValidator,
              isPhoneField: true,
            ),
            SizedBox(height: screenHeight * 0.02),
            CustomTextField(
              hintText: 'Password',
              isPassword: true,
              controller: passwordController,
              validator: Validator.passwordValidator,
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  splashRadius: 30,
                  value: agreeToTerms,
                  onChanged: onAgreeToTermsChanged,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 13.h),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                          children: const [
                            TextSpan(text: 'I agree to the Platform '),
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
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
              onPressed: onSignUp,
            ),
            SizedBox(height: screenHeight * 0.005),
            NavigationLink(
              questionText: "Joined us before?",
              actionText: "Login",
              onPressed: () {
                Navigator.of(context).pushNamed(Routes.loginScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
