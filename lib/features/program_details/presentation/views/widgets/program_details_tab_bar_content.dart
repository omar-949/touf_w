import 'package:flutter/material.dart';
import 'package:toufwshouf/features/home/data/models/active_program_model/active_program_model.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/overview/overview_tab_bar_content.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/photo_gallery/photo_gallery_tab_bar_content.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/review_section/review_tab_bar_content.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/supplement/supplement_tab_bar_content.dart';

class ProgramDetailsTabBarContent extends StatelessWidget {
  final int index;
  final ActiveProgramModel activeProgramModel;

  const ProgramDetailsTabBarContent({super.key, required this.index, required this.activeProgramModel});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const OverviewTabBarContent();
      case 1:
        return const SupplementTabBarContent();
      case 2:
        return const PhotoGalleryTabBarContent();
      case 3:
        return ReviewTabBarContent(
          activeProgramModel: activeProgramModel,
        );
      default:
        return Container();
    }
  }
}
