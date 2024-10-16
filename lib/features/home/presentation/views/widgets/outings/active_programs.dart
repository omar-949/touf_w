import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/home_section_header.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/outings/outings_list_view.dart';

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
        ),
        10.verticalSpace,
        OutingsListView()
      ],
    );
  }
}
