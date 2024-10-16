import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/widgets/app_text_button.dart';
import 'package:toufwshouf/features/auth/data/models/validate_email_model/validate_email_request.dart';
import 'package:toufwshouf/features/auth/presentation/manager/validate_email_cubit/validate_email_cubit.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/code_validation/otp_pin_put.dart';

class CodeValidationForm extends StatefulWidget {
  const CodeValidationForm({super.key, required this.email, required this.phone});
  final String email;
  final String phone;
  @override
  State<CodeValidationForm> createState() => _CodeValidationFormState();
}

class _CodeValidationFormState extends State<CodeValidationForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController otpController = TextEditingController();
  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        height: 280.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OtpPinPut(
              otpController: otpController,
              //This function triggers automatically when the 6 digit is completed
              onCompleted: (otp) {
                onSubmitted();
              },
            ),
            AppTextButton(
              onPressed: onSubmitted,
              text: "Submit",
            ),
          ],
        ),
      ),
    );
  }

  void onSubmitted() {
    if (formKey.currentState!.validate()) {
      context.read<ValidateEmailCubit>().validateOtp(validateEmailRequest: ValidateEmailRequest(email: widget.email, otpCode: otpController.text.trim(), phone: widget.phone));
    }
  }
}
