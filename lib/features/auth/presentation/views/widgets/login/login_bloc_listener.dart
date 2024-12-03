import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/helpers/toast_helper.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/login/login_form.dart';

import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../manager/login_cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.blue500,
              ),
            ),
          );
        } else if (state is LoginSuccess) {
          context.pop();
          context.pushNamed(Routes.homeView);
          ToastHelper.showSuccessToast(
              "Login Successfully,Welcome ${state.loginResponse.name}");
        } else if (state is LoginFailure) {
          context.pop();
          ToastHelper.showErrorToast(state.errMessage);
        }
      },
      child: const LoginForm(),
    );
  }
}
