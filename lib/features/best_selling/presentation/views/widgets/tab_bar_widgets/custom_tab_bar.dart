import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  const CustomTabBar({required this.tabController, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      alignment: Alignment.centerLeft,
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        labelColor: AppColors.orange,
        unselectedLabelColor: Colors.black54,
        indicatorColor: AppColors.orange,
        automaticIndicatorColorAdjustment: false,
        dividerColor: AppColors.background,
        indicatorWeight: 3.0,
        indicatorSize: TabBarIndicatorSize.label,
        labelStyle: TextStyles.font18MediumGreyMedium,
        dragStartBehavior: DragStartBehavior.start,
        unselectedLabelStyle: TextStyles.font18MediumGreyMedium,
        tabAlignment: TabAlignment.start,
        tabs: const [
          Tab(text: 'Overview'),
          Tab(text: 'Supplement'),
          Tab(text: 'Photo Gallery'),
          Tab(text: 'Reviews'),
        ],
      ),
    );
  }
}
