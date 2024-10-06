import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/validator.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';
import 'package:toufwshouf/core/widgets/custom_text_field.dart';
import 'package:toufwshouf/core/widgets/header.dart';

class ForgetPasswordWidget extends StatefulWidget {
  const ForgetPasswordWidget({super.key});

  @override
  _ForgetPasswordWidgetState createState() => _ForgetPasswordWidgetState();
}

class _ForgetPasswordWidgetState extends State<ForgetPasswordWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _resetPassword() async {
    if (_formKey.currentState?.validate() ?? false) {
      String email = _emailController.text;
      Navigator.pushNamed(context, Routes.resetpassScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final height = screenSize.height;

    final containerWidth = 0.85 * width;
    final containerHeight = 0.50 * height;
    final textPadding = 0.04 * width;

    double getFontSize(double scaleFactor) => scaleFactor * width / 100;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Header(
                  logoAsset: "assets/logo_en 2.png",
                  imageAsset: "assets/auth/forget_pass.png",
                ),
                SizedBox(height: 10.h),
                Center(child: Text("Forgot password?", style: TextStyles.font26GreyExtraBold)),
                SizedBox(height: 10.h),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: textPadding),
                    child: Text(
                      "Don’t worry! It happens. Please enter the email address associated with your account.",
                      textAlign: TextAlign.center,
                      style: TextStyles.font14GreyMedium,
                    ),
                  ),
                ),
                SizedBox(
                  width: 327.w,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 0.09 * containerHeight),
                          CustomTextField(
                            hintText: "Insert email address / mobile number",
                            controller: _emailController,
                            validator: Validator.emailValidator,
                          ),
                          SizedBox(height: 100.h),
                          CustomButton(
                            text: 'Submit',
                            onPressed: _resetPassword,
                          ),
                          const SizedBox(height: 140),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
