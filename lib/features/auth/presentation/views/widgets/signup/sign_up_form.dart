import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/helpers/validator.dart';
import 'package:toufwshouf/core/widgets/app_text_button.dart';
import 'package:toufwshouf/core/widgets/custom_text_field.dart';
import 'package:toufwshouf/features/auth/data/models/sign_up_model/sign_up_request.dart';
import 'package:toufwshouf/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/signup/agree_to_policies.dart';

import '../../../../../../core/routing/routes.dart';

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
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) =>
            const Center(child: CircularProgressIndicator()),
          );
        } else if (state is SignUpSuccess) {
          context.pushNamed(Routes.codeVerificationScreen);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Signed up successfully")),
          );
        } else if (state is SignUpFailure) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        }
      },
      builder: (context, state) {
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
                    context.read<SignUpCubit>().signUp(
                      signUpRequest: SignUpRequest(phone: phoneController.text.trim(), email: emailController.text.trim(), userName: "${firstnameController.text.trim()} ${lastnameController.text.trim()}", password: passwordController.text.trim(), nat: "1", address: "address",));
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
      },
    );
  }
}
