import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/validator.dart';
import 'package:toufwshouf/core/widgets/app_text_button.dart';
import 'package:toufwshouf/core/widgets/custom_text_field.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/signup/agree_to_policies.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            hintText: "First name",
            validator: Validator.userNameValidator,
            controller: firstnameController,
          ),
          10.verticalSpace,
          CustomTextField(
            hintText: "Last name",
            validator: Validator.userNameValidator,
            controller: lastnameController,
          ),
          10.verticalSpace,
          CustomTextField(
            hintText: "Email",
            validator: Validator.emailValidator,
            controller: emailController,
          ),
          10.verticalSpace,
          CustomTextField(
            hintText: "Phone number",
            validator: Validator.phoneNumberValidator,
            keyboardType: TextInputType.phone,
            controller: phoneController,
            isPhoneField: true,
          ),
          10.verticalSpace,
          CustomTextField(
            hintText: "Password",
            validator: Validator.passwordValidator,
            controller: passwordController,
            isPassword: true,
          ),
          10.verticalSpace,
          AgreeToPolicies(
            validator: (value) {
              if (value != true) {
                return 'You must agree to the terms and conditions.';
              }
              return null;
            },
            autovalidateMode: autoValidateMode,
          ),
          10.verticalSpace,
          AppTextButton(
            text: "Sign up",
            onPressed: () {
              if (formKey.currentState!.validate()) {
              } else {
                autoValidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          10.verticalSpace,
        ],
      ),
    );
  }
}
