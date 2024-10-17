import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/features/auth/presentation/manager/validate_email_cubit/validate_email_cubit.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/code_validation/code_validation_form.dart';

import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/routing/routes.dart';

class CodeValidationBlocListener extends StatelessWidget {
  const CodeValidationBlocListener(
      {super.key, required this.email, required this.phone});
  final String email;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ValidateEmailCubit, ValidateEmailState>(
        listener: (context, state) {
          if (state is ValidateEmailLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => Center(
                child: CircularProgressIndicator(
                  color: AppColors.blue500,
                ),
              ),
            );
          } else if (state is ValidateEmailSuccess) {
            context.pop();
            context.pushNamed(Routes.homeView);
            context.showSnackBar(
              Text("Validation Successfully"),
            );
          } else if (state is ValidateEmailFailure) {
            context.pop();
            context.showSnackBar(Text(state.errMessage));
          }
        },
        child: CodeValidationForm(email: email, phone: phone));
  }
}
