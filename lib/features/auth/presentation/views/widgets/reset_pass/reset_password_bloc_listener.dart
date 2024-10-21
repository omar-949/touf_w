import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/reset_pass/reset_password_form.dart';

import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/routing/routes.dart';
class ResetPasswordBlocListener extends StatelessWidget {
  const ResetPasswordBlocListener({super.key, required this.otp, required this.transNo, required this.email});
  final String otp;
  final int transNo;
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: AppColors.blue500,
                ),
              ),
            );
          } else if (state is ResetPasswordSuccess) {
            context.pop();
            context.pushNamed(Routes.loginView);
            context.showSnackBar(
              const Text("Reset Password Successfully,Please login now"),
            );
          } else if (state is ResetPasswordFailure) {
            context.pop();
            context.showSnackBar(Text(state.errMessage));
          }
        },
        child: ResetPasswordForm(otp: otp, transNo: transNo, email: email,));
  }
}
