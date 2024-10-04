import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/validator.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/core/widgets/CustomTextField.dart';
import 'package:toufwshouf/core/widgets/Navigation_link.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';

import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/resources/styles.dart';


class LoginForm extends StatefulWidget {
  final VoidCallback onLogin;
  final ValueChanged<bool?> onCheckboxChanged;

  const LoginForm({
    Key? key,
    required this.onLogin,
    required this.onCheckboxChanged,
  }) : super(key: key);

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
                    widget.onCheckboxChanged(value);
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
              onPressed: widget.onLogin,
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
          ],
        ),
      ),
    );
  }
}
