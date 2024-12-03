import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/core/widgets/custom_loading.dart';
import 'package:toufwshouf/features/home/data/models/active_program_model/active_program_model.dart';
import 'package:toufwshouf/features/program_details/presentation/manager/details_tab_bar_cubit/details_tab_bar_cubit.dart';
import 'package:toufwshouf/features/program_details/presentation/manager/program_details_cubit.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_action_button.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_book_button.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_header.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_tab_bar.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_tab_bar_content.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_information.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/tour_details.dart';

class ProgramDetailsBody extends StatelessWidget {
  const ProgramDetailsBody({super.key, required this.activeProgramModel});

  final ActiveProgramModel activeProgramModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramDetailsCubit, ProgramDetailsState>(
      builder: (context, state) {
        if (state is ProgramDetailsLoading) {
          return const CustomLoading();
        } else if (state is ProgramDetailsSuccess) {
          return CustomScrollView(
            slivers: [
              ProgramDetailsHeader(
                activeProgramModel: activeProgramModel,
              ),
              const ProgramActionButtons(),
              state.productDetails != null && state.productDetails!.isNotEmpty
                  ? ProgramInformation(
                      detailsActiveProgramModel: state.productDetails![0],
                    )
                  : const SliverToBoxAdapter(
                      child: CustomLoading(),
                    ),
              const ProgramDetailsTabBar(),
              SliverToBoxAdapter(
                child: BlocBuilder<DetailsTabBarCubit, DetailsTabBarState>(
                  builder: (context, state) {
                    if (state is DetailsTabBarIndexUpdated) {
                      return ProgramDetailsTabBarContent(
                        index: state.index,
                        activeProgramModel: activeProgramModel,
                      );
                    }
                    return ProgramDetailsTabBarContent(
                      index: 0,
                      activeProgramModel: activeProgramModel,
                    );
                  },
                ),
              ),
              TourDetails(
                tourIncludingModel: state.tourIncluding ?? [],
                policyModel: state.policy ?? [],
              ),
              ProgramDetailsBookButton(activeProgramModel: activeProgramModel),
            ],
          );
        } else if (state is ProgramDetailsFailure) {
          return Center(
            child: Text(
              state.message,
            ),
          );
        } else {
          return const Center(
            child: Text('Unhandled State'),
          );
        }
      },
    );
  }
}
