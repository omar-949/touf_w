import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/program_details/data/models/details_active_program_model/details_active_program_model.dart';
import 'package:toufwshouf/features/program_details/data/models/photo_gallery_model/photo_gallery_model.dart';
import 'package:toufwshouf/features/program_details/data/models/supplement_model/supplements_model.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/overview/overview_tab_bar_content.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/photo_gallery/photo_gallery_tab_bar_content.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/review_section/review_item_list_view.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/supplement/supplement_tab_bar_content.dart';

class ProgramDetailsTabBarView extends StatefulWidget {
  const ProgramDetailsTabBarView(
      {super.key,
      required this.tabController,
      required this.detailsActiveProgramModel,
      required this.supplements,
      required this.photoGallery});

  final TabController tabController;
  final DetailsActiveProgramModel detailsActiveProgramModel;
  final List<SupplementsModel> supplements;
  final List<PhotoGalleryModel> photoGallery;

  @override
  State<ProgramDetailsTabBarView> createState() =>
      _ProgramDetailsTabBarViewState();
}

class _ProgramDetailsTabBarViewState extends State<ProgramDetailsTabBarView> {
  final List<double> _heights = [500.h, 500.h, 370.h, 500.h];
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
        controller: widget.tabController,
        children: [
          SingleChildScrollView(
            child: OverviewTabBarContent(
              detailsActiveProgramModel: widget.detailsActiveProgramModel,
            ),
          ),
          SupplementTabBarContent(
            supplements: widget.supplements,
          ),
          SizedBox(
            height: 370.h,
            child: PhotoGalleryTabBarContent(
              photoGallery: widget.photoGallery,
            ),
          ),
          const ReviewItemListView()
        ],
      ),
    );
  }
}
