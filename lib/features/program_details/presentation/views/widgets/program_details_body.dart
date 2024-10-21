import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toufwshouf/features/program_details/presentation/manager/program_details_cubit.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_action_button.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_book_button.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_header.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_tab_bar.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_information.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/related_trips.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/tour_details.dart';

class ProgramDetailsBody extends StatelessWidget {
  const ProgramDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgramDetailsCubit, ProgramDetailsState>(
      builder: (context, state) {
        return const CustomScrollView(
          slivers: [
            ProgramDetailsHeader(),
            ProgramActionButtons(),
            ProgramInformation(),
            ProgramDetailsTabBar(),
            TourDetails(),
            ProgramDetailsBookButton(),
            RelatedTrips(),
          ],
        );
      },
    );
  }
}
