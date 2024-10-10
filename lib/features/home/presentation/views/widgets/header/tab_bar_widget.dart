import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/hotels/hotels_body.dart';
import '../../../../../../core/resources/assets.dart';
import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/resources/styles.dart';
import '../outings/outings_body.dart';

class CustomTabWidget extends StatefulWidget {
  const CustomTabWidget({super.key});

  @override
  _CustomTabWidgetState createState() => _CustomTabWidgetState();
}

class _CustomTabWidgetState extends State<CustomTabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  double tabContentHeight = 965.h; // Default height for "Outings" tab

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        setState(() {
          // Change the height based on the selected tab index
          switch (_tabController.index) {
            case 0:
              tabContentHeight = 965.h; // Height for "Outings"
              break;
            case 1:
              tabContentHeight = 3030.h; // Height for "Hotels"
              break;
            case 2:
              tabContentHeight = 700.h; // Optional: Add custom height for "Transportation"
              break;
          }
        });
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCustomTabBar(),
        // The height of the SizedBox will change dynamically based on the selected tab
        SizedBox(
          height: tabContentHeight,
          child: _buildTabBarView(),
        ),
      ],
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
    return LayoutBuilder(
      builder: (context, constraints) {
        // Listen for changes in tab index and adjust height accordingly
        return AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: IndexedStack(
            index: _tabController.index,
            children: [
              _buildDynamicHeightContent(OutingsBody()),
              _buildDynamicHeightContent(const HotelsBody()),
              _buildDynamicHeightContent(
                  const Center(child: Text('Transportation Content'))),
            ],
          ),
        );
      },
    );
  }

  // Widget to calculate and adjust the height dynamically
  Widget _buildDynamicHeightContent(Widget content) {
    return LayoutBuilder(
      builder: (context, constraints) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            tabContentHeight = constraints.maxHeight;
          });
        });
        return content;
      },
    );
  }
}
