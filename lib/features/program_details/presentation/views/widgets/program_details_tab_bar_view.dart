import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/program_details/data/models/details_active_program_model/details_active_program_model.dart';
import 'package:toufwshouf/features/program_details/data/models/photo_gallery_model/photo_gallery_model.dart';
import 'package:toufwshouf/features/program_details/data/models/reviews_model/reviews_model.dart';
import 'package:toufwshouf/features/program_details/data/models/supplement_model/supplements_model.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/overview/overview_tab_bar_content.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/photo_gallery/photo_gallery_tab_bar_content.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/review_section/review_tab_bar_content.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/supplement/supplement_tab_bar_content.dart';

class ProgramDetailsTabBarView extends StatefulWidget {
  const ProgramDetailsTabBarView(
      {super.key, required this.tabController,});

  final TabController tabController;


  @override
  State<ProgramDetailsTabBarView> createState() =>
      _ProgramDetailsTabBarViewState();
}

class _ProgramDetailsTabBarViewState extends State<ProgramDetailsTabBarView> {
  final List<double> _heights = [500.h, 500.h, 370.h, 580.h];
  double _currentHeight = 500.h;

  @override
  void initState() {
    super.initState();
    widget.tabController.addListener(_updateHeight);
  }

  @override
  void dispose() {
    widget.tabController.removeListener(_updateHeight);
    super.dispose();
  }

  void _updateHeight() {
    setState(() {
      _currentHeight = _heights[widget.tabController.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _currentHeight,
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: widget.tabController,
        children: [
          const SingleChildScrollView(
            child: OverviewTabBarContent(
            ),
          ),
          const SupplementTabBarContent(),
          const PhotoGalleryTabBarContent(
          ),
          const SingleChildScrollView(child: ReviewTabBarContent()),
        ],
      ),
    );
  }
}
