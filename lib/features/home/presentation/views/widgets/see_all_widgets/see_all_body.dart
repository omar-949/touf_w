import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/core/widgets/custom_loading.dart';
import 'package:toufwshouf/features/home/presentation/manager/active_program_cubit/active_program_cubit.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/see_all_widgets/see_all_list_view_item.dart';

class SeeAllBody extends StatelessWidget {
  const SeeAllBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveProgramCubit, ActiveProgramState>(
      builder: (context, state) {
        if (state is ActiveProgramLoading) {
          return const CustomLoading();
        } else if (state is ActiveProgramSuccess) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.pushNamed(
                    Routes.programDetailsView,
                    arguments: {
                      'title': 'Active Programs',
                      'program': state.activeProgramModel[index],
                    },
                  );
                },
                child: SeeAllListViewItem(
                  programModel: state.activeProgramModel[index],
                ),
              );
            },
            itemCount: state.activeProgramModel.length,
          );
        } else if (state is ActiveProgramFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: Text('Unhandled State'));
        }
      },
    );
  }
}
