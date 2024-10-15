import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/validator.dart';
import 'package:toufwshouf/core/widgets/app_text_button.dart';
import 'package:toufwshouf/core/widgets/custom_text_field.dart';
import 'package:toufwshouf/features/auth/data/models/sign_up_model/sign_up_request.dart';
import 'package:toufwshouf/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/signup/agree_to_policies.dart';

class SignUpForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController phoneController;

  const SignUpForm({
    Key? key,
    required this.emailController,
    required this.phoneController,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  void dispose() {
    firstnameController.dispose();
    lastnameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(
            hintText: "First name",
            validator: Validator.userNameValidator,
            controller: firstnameController,
            autoValidateMode: autoValidateMode,
          ),
          10.verticalSpace,
          CustomTextField(
            hintText: "Last name",
            validator: Validator.userNameValidator,
            controller: lastnameController,
            autoValidateMode: autoValidateMode,
          ),
          10.verticalSpace,
          CustomTextField(
            hintText: "Email",
            validator: Validator.emailValidator,
            controller: widget.emailController,
            autoValidateMode: autoValidateMode,
          ),
          10.verticalSpace,
          CustomTextField(
            hintText: "Phone number",
            validator: Validator.phoneNumberValidator,
            keyboardType: TextInputType.phone,
            controller: widget.phoneController,
            isPhoneField: true,
            autoValidateMode: autoValidateMode,
          ),
          10.verticalSpace,
          CustomTextField(
            hintText: "Password",
            validator: Validator.passwordValidator,
            controller: passwordController,
            isPassword: true,
            autoValidateMode: autoValidateMode,
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
                context.read<SignUpCubit>().signUp(
                  signUpRequest: SignUpRequest(
                    phone: widget.phoneController.text.trim(),
                    email: widget.emailController.text.trim(),
                    userName:
                    "${firstnameController.text.trim()} ${lastnameController.text.trim()}",
                    password: passwordController.text.trim(),
                    nat: "1",
                    address: "address",
                  ),
                );
              } else {
                setState(() {
                  autoValidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
          10.verticalSpace,
        ],
      ),
    );
  }
}
