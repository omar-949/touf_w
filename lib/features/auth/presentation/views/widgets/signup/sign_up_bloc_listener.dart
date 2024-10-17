import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/signup/sign_up_form.dart';

import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../manager/sign_up_cubit/sign_up_cubit.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    return BlocListener<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is SignUpLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.blue500,
                ),
              ),
            );
          } else if (state is SignUpSuccess) {
            context.pop();
            context.pushNamed(Routes.codeVerificationView, arguments: {
              'email': emailController.text.trim(),
              'phone': phoneController.text.trim()
            });
            context.showSnackBar(
              Text("Please Review Your Mail"),
            );
          } else if (state is SignUpFailure) {
            context.pop();
            context.showSnackBar(Text(state.errMessage));
          }
        },
        child: SignUpForm(
            emailController: emailController,
            phoneController: phoneController));
  }
}
