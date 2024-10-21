import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/features/auth/presentation/manager/validate_email_cubit/validate_email_cubit.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/code_validation/code_validation_body.dart';

import '../../../../core/di/service_locator.dart';
import '../../data/repos/auth_repo/auth_repo_impl.dart';

class CodeValidationView extends StatelessWidget {
  const CodeValidationView(
      {super.key, required this.email, required this.phone});
  final String email;
  final String? phone;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ValidateEmailCubit(getIt.get<AuthRepoImpl>()),
        child: CodeValidationBody(email: email, phone: phone),
      ),
    );
  }
}
