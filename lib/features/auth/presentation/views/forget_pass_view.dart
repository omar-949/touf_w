import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/features/auth/presentation/manager/forget_password_cubit/forget_password_cubit.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/forget_pass/forget_pass_body.dart';

import '../../../../core/di/service_locator.dart';
import '../../data/repos/auth_repo/auth_repo_impl.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ForgetPasswordCubit(getIt.get<AuthRepoImpl>()),
        child: const ForgetPassBody(),
      ),
    );
  }
}
