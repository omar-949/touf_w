import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/validator.dart';
import 'package:toufwshouf/core/widgets/app_text_button.dart';
import 'package:toufwshouf/core/widgets/custom_text_field.dart';

import '../../../manager/forget_password_cubit/forget_password_cubit.dart';

class ForgetPassForm extends StatefulWidget {
  const ForgetPassForm({super.key, required this.forgetPassController});
  final TextEditingController forgetPassController;

  @override
  State<ForgetPassForm> createState() => _ForgetPassFormState();
}

class _ForgetPassFormState extends State<ForgetPassForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  void dispose() {
    widget.forgetPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: SizedBox(
        height: 320.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              hintText: "Insert email address",
              controller: widget.forgetPassController,
              validator: Validator.validatePhoneOrEmail,
              autoValidateMode: autoValidateMode,
            ),
            AppTextButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  context.read<ForgetPasswordCubit>().forgetPassword(email: widget.forgetPassController.text.trim());
                } else {
                  setState(() {
                    autoValidateMode = AutovalidateMode.always;
                  });
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
