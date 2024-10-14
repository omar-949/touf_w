import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/login/login_body.dart';

import '../../../../core/di/service_locator.dart';
import '../../data/repos/auth_repo/auth_repo_impl.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(getIt.get<AuthRepoImpl>()),
        child: LoginBody(),
      ),
    );
  }
}
