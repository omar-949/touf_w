import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/overview/overview_tab_bar_content.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/photo_gallery/photo_gallery_tab_bar_content.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/supplement/supplement_tab_bar_content.dart';

class ProgramDetailsTabBarView extends StatelessWidget {
  const ProgramDetailsTabBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 500.h,
        child: const TabBarView(
          children: [
            SingleChildScrollView(child: OverviewTabBarContent()),
            SupplementTabBarContent(),
            PhotoGalleryTabBarContent(),
            Center(child: Text('Reviews'),),
          ],
        ),
      ),
    );
  }
}
