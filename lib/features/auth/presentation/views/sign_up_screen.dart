import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/core/di/service_locator.dart';
import 'package:toufwshouf/features/auth/data/repos/auth_repo/auth_repo_impl.dart';
import 'package:toufwshouf/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/signup/sign_up_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => SignUpCubit(getIt.get<AuthRepoImpl>()),
        child: SafeArea(child: SignUpBody()),
      ),
    );
  }
}
