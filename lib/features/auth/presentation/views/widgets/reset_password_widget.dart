import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/CustomTextField.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:toufwshouf/core/helpers/app_regex.dart';
import '../../../../../core/helpers/validator.dart';
import '../../../../../core/routing/routes.dart';
import 'Header_widget.dart';

class ResetPasswordWidget extends StatefulWidget {
  const ResetPasswordWidget({super.key});

  @override
  State<ResetPasswordWidget> createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  // Validation states
  bool _isValidLength = false;
  bool _hasNumber = false;
  bool _hasUppercase = false;
  bool _hasLowercase = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _checkPasswordValidation(String password) {
    setState(() {
      _isValidLength = password.length >= 8;
      _hasNumber = AppRegex.hasNumber(password);
      _hasUppercase = AppRegex.hasUpperCase(password);
      _hasLowercase = AppRegex.hasLowerCase(password);
    });
  }

  double _getStrength() {
    int score = 0;
    if (_isValidLength) score++;
    if (_hasNumber) score++;
    if (_hasUppercase) score++;
    if (_hasLowercase) score++;
    return score / 4; // Return a value between 0.0 and 1.0
  }

  void _resetPassword() {
    if (_formKey.currentState?.validate() ?? false) {
      String pass = _confirmPasswordController.text;
      // Initiate the reset password request
      Navigator.pushNamed(context,Routes.resetpassScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Header(
                logoAsset: "assets/logo_en 2.png",
                imageAsset: "assets/auth/reset_pass.png",
              ),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  "Reset Password",
                  style: TextStyles.font26GreyExtraBold,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        hintText: 'Enter new password',
                        isPassword: true,
                        controller: _passwordController,
                        onChanged: (value) => _checkPasswordValidation(value),
                      ),
                      SizedBox(height: 8.h),
                      // Password Strength Indicator
                      Container(
                        height: 3.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey[300],
                        ),
                        child: FractionallySizedBox(
                          widthFactor: _getStrength(),
                          heightFactor: 1,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: _getStrength() == 1
                                  ? Colors.green
                                  : _getStrength() >= 0.5
                                  ? Color(0xffFFC542)
                                  : Colors.red,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _ValidationRule(
                              rule: "At least 8 characters",
                              isValid: _isValidLength,
                            ),
                            _ValidationRule(
                              rule: "At least one number",
                              isValid: _hasNumber,
                            ),
                            _ValidationRule(
                              rule: "At least one uppercase letter",
                              isValid: _hasUppercase,
                            ),
                            _ValidationRule(
                              rule: "At least one lowercase letter",
                              isValid: _hasLowercase,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomTextField(
                        hintText: 'Confirm new password',
                        isPassword: true,
                        controller: _confirmPasswordController,
                        validator: (value) => Validator.passwordConfirmValidator(value, _passwordController.text),
                      ),
                      SizedBox(height: 70.h),
                      if (_isLoading)
                        const Center(child: CircularProgressIndicator())
                      else
                        Center(
                          child: CustomButton(
                            text: 'Submitting...',
                            onPressed: _resetPassword,
                          ),
                        ),
                      SizedBox(height: 20.h), // Add some bottom padding
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ValidationRule extends StatelessWidget {
  final String rule;
  final bool isValid;

  const _ValidationRule({
    Key? key,
    required this.rule,
    required this.isValid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Icon(
            isValid ? Icons.check : Icons.circle,
            color: isValid ? Colors.green : Color(0xffA0AEC0),
            size: isValid ? 18 : 10,
          ),
        ),
        const SizedBox(width: 8), // Adjusted space between icon and text
        Expanded(
          child: Text(
            rule,
            style: TextStyles.font14Grey600Regular.copyWith(
              color: isValid ? Colors.green : Color(0xffA0AEC0),
              fontSize: 12.sp,

            ),
          ),
        ),
      ],
    );
  }
}
