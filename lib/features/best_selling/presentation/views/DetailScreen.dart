import 'package:flutter/material.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/widgets/custom_appbar.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';
import 'package:toufwshouf/features/best_selling/presentation/views/widgets/expandable_section.dart';
import 'package:toufwshouf/features/best_selling/presentation/views/widgets/info_box.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/button_list.dart';
import 'widgets/custom_tab_bar.dart';
import '../../../../core/widgets/stack_image.dart';
import 'widgets/tab_bar_view.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with TickerProviderStateMixin {
  bool isTourExpanded = false;
  bool isPolicyExpanded = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(title: 'Best Selling', route: ''),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            const StackImage(
              imageUrl: 'assets/best_selling/header.png',
              tripName: 'The Egyptian Gulf (Hospice of he Sultan)',
            ),
            SizedBox(height: 10.h),
            const ButtonList(),
            SizedBox(height: 20.h),
            const InfoBox(),
            SizedBox(height: 20.h),
            CustomTabBar(tabController: _tabController),
            TabBarViewWidget(tabController: _tabController),
            _buildExpandableSection(
              title: 'Tour Including',
              content:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Suspendisse malesuada lacus ex, sit amet blandit leo lobortis eget.',
              isExpanded: isTourExpanded,
              onTap: () {
                setState(() {
                  isTourExpanded = !isTourExpanded;
                });
              },
            ),
            SizedBox(height: 10.h),
            _buildExpandableSection(
              title: 'Cancellation Policy',
              content:
                  'You can cancel up to 24 hours in advance of the experience for a full refund. For a full refund, you must cancel at least 24 hours before the experience’s start time.If you cancel less than 24 hours before the experience’s start time, the amount you paid will not be refunded. Any changes made less than 24 hours before the experience’s start time will not be accepted. Cut-off times are based on theexperience’s local time.',
              isExpanded: isPolicyExpanded,
              onTap: () {
                setState(() {
                  isPolicyExpanded = !isPolicyExpanded;
                });
              },
            ),
            SizedBox(height: 30.h),
            CustomButton(
              text: 'Book Now',
              onPressed: () {},
              backgroundColor: AppColors.orange,
              width: 358.w,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExpandableSection({
    required String title,
    required String content,
    required bool isExpanded,
    required VoidCallback onTap,
  }) {
    return ExpandableSection(
      title: title,
      content: content,
      isExpanded: isExpanded,
      onTap: onTap,
    );
  }
}
