import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/hotels_body.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/outings_body.dart';

import '../../../../../core/resources/assets.dart';
import '../../../../../core/resources/colors.dart';
import '../../../../../core/resources/styles.dart';

class CustomTabWidget extends StatefulWidget {
  const CustomTabWidget({super.key});

  @override
  _CustomTabWidgetState createState() => _CustomTabWidgetState();
}

class _CustomTabWidgetState extends State<CustomTabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCustomTabBar(),
          // Constrain the height of the TabBarView to avoid extra space
          SizedBox(
            height: MediaQuery.of(context).size.height - kToolbarHeight - 50.h, // Adjust the height as per requirement
            child: _buildTabBarView(),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomTabBar() {
    return TabBar(
      controller: _tabController,
      indicatorColor: AppColors.orange,
      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.start,
      indicatorWeight: 2,
      isScrollable: true,
      labelStyle: TextStyles.font18OrangeRegular,
      unselectedLabelStyle: TextStyles.font18WhiteRegular,
      labelPadding: EdgeInsets.symmetric(horizontal: 10.w),
      onTap: (index) {
        setState(() {
          _tabController.index = index;
        });
      },
      tabs: [
        _buildTab('Outings', Assets.outingsIcon, 0),
        _buildTab('Hotels', Assets.hotelsIcon, 1),
        _buildTab('Transportation', Assets.transportationIcon, 2),
      ],
    );
  }

  Widget _buildTab(String title, String assetPath, int index) {
    return AnimatedBuilder(
      animation: _tabController,
      builder: (context, child) {
        return Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                assetPath,
                color: _tabController.index == index
                    ? AppColors.orange
                    : AppColors.background,
              ),
              SizedBox(width: 8.w),
              Text(title),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTabBarView() {
    return IndexedStack(
      index: _tabController.index,
      children: [
        OutingsBody(),
        HotelsBody(),
        const Center(child: Text('Transportation Content')),
      ],
    );
  }
}
