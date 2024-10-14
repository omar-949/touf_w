import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:toufwshouf/core/helpers/validator.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/widgets/app_text_button.dart';
import 'package:toufwshouf/core/widgets/app_text_form_field.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/login/remember_information.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool isObscureText = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppTextFormField(
            hintText: "Email",
            controller: emailController,
            validator: (value) {
              return Validator.emailValidator(value);
            },
          ),
          10.verticalSpace,
          AppTextFormField(
            hintText: "Password",
            controller: passwordController,
            validator: (value) {
              return Validator.loginPasswordValidator(value);
            },
            enableCopyPaste: false,
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Iconsax.eye_slash_outline : Iconsax.eye_outline,
                size: 24.w,
                color: AppColors.grey500,
              ),
            ),
          ),
          4.verticalSpace,
          RememberInformation(),
          10.verticalSpace,
          AppTextButton(
            text: "Login",
            onPressed: () {
              if (formKey.currentState!.validate()) {
              } else {
                setState(() {
                  autoValidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ],
      ),
    );
  }
}

