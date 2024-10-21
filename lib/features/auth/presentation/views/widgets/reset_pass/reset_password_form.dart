import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/app_regex.dart';
import 'package:toufwshouf/core/helpers/validator.dart';
import 'package:toufwshouf/core/widgets/app_text_button.dart';
import 'package:toufwshouf/core/widgets/custom_text_field.dart';
import 'package:toufwshouf/features/auth/data/models/reset/reset_password_request.dart';
import 'package:toufwshouf/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/reset_pass/password_validations.dart';

class ResetPasswordForm extends StatefulWidget {
  const ResetPasswordForm(
      {super.key,
      required this.otp,
      required this.transNo,
      required this.email});

  final String otp;
  final int transNo;
  final String email;

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  final TextEditingController newPassController = TextEditingController();
  final TextEditingController confirmNewPassController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool minLength = false;
  bool hasNumber = false;
  bool hasSymbol = false;
  bool hasUppercase = false;
  bool hasLowercase = false;

  @override
  void initState() {
    super.initState();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    newPassController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(newPassController.text);
        hasUppercase = AppRegex.hasUpperCase(newPassController.text);
        hasNumber = AppRegex.hasNumber(newPassController.text);
        minLength = AppRegex.hasMinLength(newPassController.text);
        hasSymbol = AppRegex.hasSpecialCharacter(newPassController.text);
      });
    });
  }

  @override
  void dispose() {
    newPassController.dispose();
    confirmNewPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        height: 380.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomTextField(
                  hintText: "Enter new password",
                  controller: newPassController,
                ),
                10.verticalSpace,
                PasswordValidations(
                  minLength: minLength,
                  hasNumber: hasNumber,
                  hasUppercase: hasUppercase,
                  hasLowercase: hasLowercase,
                  hasSymbol: hasSymbol,
                ),
                10.verticalSpace,
                CustomTextField(
                  hintText: "Confirm new password",
                  controller: confirmNewPassController,
                  validator: (value) {
                    return Validator.passwordConfirmValidator(
                      value,
                      newPassController.text,
                    );
                  },
                ),
              ],
            ),
            10.verticalSpace,
            AppTextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<ResetPasswordCubit>().resetPassword(
                        resetPasswordRequest: ResetPasswordRequest(
                          password: newPassController.text.trim(),
                          otp: widget.otp,
                          transNo: widget.transNo,
                          email: widget.email,
                        ),
                      );
                }
              },
              text: "Submit",
            ),
          ],
        ),
      ),
    );
  }
}
