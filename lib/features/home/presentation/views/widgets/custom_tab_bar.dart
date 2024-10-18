import 'package:flutter/material.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/custom_tab.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.tabController,
  });

  final TabController tabController;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: widget.tabController,
      isScrollable: true,
      indicatorColor: AppColors.orange,
      labelColor: AppColors.orange,
      unselectedLabelColor: Colors.white,
      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.center,
      physics: const NeverScrollableScrollPhysics(),
      onTap: (index) {
        setState(() {
          activeIndex = index;
        });
      },
      tabs: [
        CustomTab(
          iconPath: 'assets/svgs/outings.svg',
          text: 'Outings',
          isActive: activeIndex == 0,
        ),
        CustomTab(
          iconPath: 'assets/svgs/hotels.svg',
          text: 'Hotels',
          isActive: activeIndex == 1,
        ),
        CustomTab(
          iconPath: 'assets/svgs/Transportation.svg',
          text: 'Transportation',
          isActive: activeIndex == 2,
        ),
      ],
    );
  }
}
