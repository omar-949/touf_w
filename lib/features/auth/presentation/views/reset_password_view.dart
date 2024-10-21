import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/reset_pass/reset_password_body.dart';

import '../../../../core/di/service_locator.dart';
import '../../data/repos/auth_repo/auth_repo_impl.dart';
import '../manager/reset_password_cubit/reset_password_cubit.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key, required this.otpCode, required this.email, required this.transNo});
  final String otpCode;
  final String email;
  final int transNo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ResetPasswordCubit(getIt.get<AuthRepoImpl>()),
        child: ResetPasswordBody(otp: otpCode, transNo: transNo, email: email),
      ),
    );
  }
}
