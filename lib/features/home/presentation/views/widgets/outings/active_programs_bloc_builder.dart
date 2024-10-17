import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/widgets/custom_loading.dart';
import 'package:toufwshouf/features/home/presentation/manager/active_program_cubit/active_program_cubit.dart';

import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/widgets/app_horizontal_list_view.dart';
import '../../../../../../core/widgets/custom_failure_widget.dart';

class ActiveProgramsBlocBuilder extends StatelessWidget {
  const ActiveProgramsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveProgramCubit, ActiveProgramState>(
        builder: (context, state) {
          if (state is ActiveProgramSuccess) {
            return AppHorizontalListView(
              onTap: () {
                context.pushNamed(Routes.programDetailsView,
                    arguments: 'Active Program');
              }, activeProgramModel: state.activeProgramModel,
            );

          } else if (state is ActiveProgramFailure) {
            return CustomFailureWidget(errMessage: state.errMessage);
          } else {
            return const CustomLoading();
          }
        });
  }
}
