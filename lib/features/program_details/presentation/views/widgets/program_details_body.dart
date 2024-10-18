import 'package:flutter/material.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_action_button.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_header.dart';

import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_tab_bar.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_tab_bar_view.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_information.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/related_trips.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/tour_details.dart';

class ProgramDetailsBody extends StatelessWidget {
  const ProgramDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: CustomScrollView(
        slivers: [
          ProgramDetailsHeader(),
          ProgramActionButtons(),
          ProgramInformation(),
          ProgramDetailsTabBar(),
          ProgramDetailsTabBarView(),
          TourDetails(),
          RelatedTrips(),
        ],
      ),
    );
  }
}