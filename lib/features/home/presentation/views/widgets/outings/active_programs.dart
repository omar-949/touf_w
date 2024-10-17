import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/home_section_header.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/outings/active_programs_bloc_builder.dart';

import '../../../../../../core/routing/routes.dart';

class ActivePrograms extends StatelessWidget {
  const ActivePrograms({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        HomeSectionHeader(
          section: "Active Programs",
          isSeeAll: true,
          onSeeAllPressed: () {
            context.pushNamed(Routes.seeAllView, arguments: {
              'title': 'Active Programs',
            });
          },
        ),
        10.verticalSpace,
        ActiveProgramsBlocBuilder()

      ],
    );
  }
}
