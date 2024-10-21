import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/features/program_details/data/models/details_active_program_model/details_active_program_model.dart';
import 'package:toufwshouf/features/program_details/data/models/photo_gallery_model/photo_gallery_model.dart';
import 'package:toufwshouf/features/program_details/data/models/supplement_model/supplements_model.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/program_details_tab_bar_view.dart';

class ProgramDetailsTabBar extends StatefulWidget {
  const ProgramDetailsTabBar({
    super.key,
    required this.detailsActiveProgramModel,
    required this.supplements,
    required this.photoGallery,
  });

  final DetailsActiveProgramModel detailsActiveProgramModel;
  final List<SupplementsModel> supplements;
  final List<PhotoGalleryModel> photoGallery;

  @override
  State<ProgramDetailsTabBar> createState() => _ProgramDetailsTabBarState();
}

class _ProgramDetailsTabBarState extends State<ProgramDetailsTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          TabBar(
            controller: tabController,
            isScrollable: true,
            indicatorColor: AppColors.orange,
            labelColor: AppColors.orange,
            unselectedLabelColor: AppColors.mediumGrey,
            dividerColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            tabAlignment: TabAlignment.center,
            labelStyle: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
            labelPadding:
                EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
            physics: const NeverScrollableScrollPhysics(),
            tabs: [
              const Center(
                child: Text('Overview'),
              ),
              const Center(
                child: Text('Supplement'),
              ),
              const Center(
                child: Text('Photo Gallery'),
              ),
              const Center(
                child: Text('Reviews'),
              ),
            ],
          ),
          ProgramDetailsTabBarView(
            tabController: tabController,
            detailsActiveProgramModel: widget.detailsActiveProgramModel,
            supplements: widget.supplements,
            photoGallery: widget.photoGallery,
          )
        ],
      ),
    );
  }
}
