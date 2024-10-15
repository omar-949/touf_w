import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/widgets/app_text_button.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/code_validation/otp_pin_put.dart';

class CodeValidationForm extends StatefulWidget {
  const CodeValidationForm({super.key});

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
    if (formKey.currentState!.validate()) {}
  }
}
