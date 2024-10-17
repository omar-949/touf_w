import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_action_button.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_header.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_tab_bar.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_information.dart';

import 'overview/expandable_container.dart';

class ProgramDetailsBody extends StatelessWidget {
  const ProgramDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        ProgramDetailsHeader(),
        ProgramActionButtons(),
        ProgramInformation(),
        ProgramDetailsTabBar(),
        SliverToBoxAdapter(child: 12.verticalSpace),
        SliverToBoxAdapter(
          child: ExpandableContainer(
            title: 'Tour Including',
            description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Suspendisse malesuada lacus ex, sit amet blandit leo lobortis eget.',
          ),
        ),
        SliverToBoxAdapter(child: 12.verticalSpace),
        SliverToBoxAdapter(
          child: ExpandableContainer(
            title: 'Cancellation policy',
            description:
            'You can cancel up to 24 hours in advance of the experience for a full refund. For a full refund, you must cancel at least 24 hours before the experience’s start time.If you cancel less than 24 hours before the experience’s start time, the amount you paid will not be refunded. Any changes made less than 24 hours before the experience’s start time will not be accepted. Cut-off times are based on theexperience’s local time.',
          ),
        ),
      ],
    );
  }
}
