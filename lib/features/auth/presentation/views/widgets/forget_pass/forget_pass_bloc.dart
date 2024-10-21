import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/forget_pass/forget_pass_form.dart';

import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/routing/routes.dart';

class ForgetPassBloc extends StatelessWidget {
  const ForgetPassBloc({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.blue500,
                ),
              ),
            );
          } else if (state is ForgetPasswordSuccess) {
            context.pop();
            context.pushNamed(Routes.codeVerificationView,arguments: {
            'email': emailController.text.trim(),
            'phone': null
            });
            context.showSnackBar(
              const Text("Please Review Your Mail"),
            );
          } else if (state is ForgetPasswordFailure) {
            context.pop();
            context.showSnackBar(Text(state.errMessage));
          }
        },
        child:  ForgetPassForm(forgetPassController: emailController,));
  }
}
