import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/validator.dart';
import 'package:toufwshouf/core/widgets/app_text_button.dart';
import 'package:toufwshouf/core/widgets/custom_text_field.dart';
import 'package:toufwshouf/features/auth/data/models/log_in_model/login_request.dart';
import 'package:toufwshouf/features/auth/presentation/manager/login_cubit/login_cubit.dart';
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
          CustomTextField(
            hintText: "Email",
            controller: emailController,
            validator: (value) {
              return Validator.emailValidator(value);
            },
            autoValidateMode: autoValidateMode,
          ),
          10.verticalSpace,
          CustomTextField(
            hintText: "Password",
            controller: passwordController,
            isPassword: true,
            validator: (value) {
              return Validator.loginPasswordValidator(value);
            },
            autoValidateMode: autoValidateMode,
          ),
          4.verticalSpace,
          //const RememberInformation(),
          10.verticalSpace,
          AppTextButton(
            text: "Login",
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<LoginCubit>().login(
                    loginRequest: LoginRequest(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim()));
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
