import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/core/widgets/custom_loading.dart';
import 'package:toufwshouf/features/home/data/models/active_program_model/active_program_model.dart';
import 'package:toufwshouf/features/program_details/presentation/manager/program_details_cubit.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_action_button.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_book_button.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_header.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_tab_bar.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_information.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/related_trips.dart';
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
              ProgramInformation(
                detailsActiveProgramModel: state.productDetails!,
              ),
              ProgramDetailsTabBar(
                detailsActiveProgramModel: state.productDetails!,
                supplements: state.supplements!,
                photoGallery: state.photoGallery!,
              ),
              TourDetails(
                tourIncludingModel: state.tourIncluding!,
              ),
              const ProgramDetailsBookButton(),
              const RelatedTrips(),
            ],
          );
        } else if (state is ProgramDetailsFailure) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Unhandled State'));
        }
      },
    );
  }
}
