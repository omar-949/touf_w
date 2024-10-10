import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/resources/assets.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/core/widgets/custom_appbar.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';
import 'package:toufwshouf/core/widgets/custom_container_details.dart';
import 'package:toufwshouf/core/widgets/stack_image.dart';
import 'package:toufwshouf/features/best_selling/presentation/views/widgets/header/button_list.dart';
import 'package:toufwshouf/features/best_selling/presentation/views/widgets/header/info_box.dart';
import 'package:toufwshouf/features/best_selling/presentation/views/widgets/tale/expandable_section.dart';
import 'package:toufwshouf/features/best_selling/presentation/views/widgets/tab_bar_widgets/custom_tab_bar.dart';
import 'package:toufwshouf/features/best_selling/presentation/views/widgets/tab_bar_widgets/tab_bar_view.dart';

import 'widgets/tale/related_list.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key});

  final List<CustomContainerDetails> relatedList = [
    const CustomContainerDetails(
      image: 'assets/best_selling/Frame 40.png',
      tripName: "The Egyptian Gulf (Hospice of the Sultan)",
      rating: 4.5,
      containerText1: 'Start From',
      containerSalary1: '850 EGP',
    ),
    const CustomContainerDetails(
      image: Assets.bestSelling2,
      tripName: "The Egyptian Gulf (Hospice of the Sultan)",
      rating: 4.5,
      containerText1: 'Start From',
      containerSalary1: '850 EGP',
    ),
  ];

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin {
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
            _buildHeaderSection(),
            SizedBox(height: 20.h),
            const InfoBox(),
            SizedBox(height: 20.h),
            CustomTabBar(tabController: _tabController),
            TabBarViewWidget(tabController: _tabController),
            _buildExpandableSection(
              title: 'Tour Including',
              content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse malesuada lacus ex, sit amet blandit leo lobortis eget.',
              isExpanded: isTourExpanded,
              onTap: () => _toggleExpandableSection('tour'),
            ),
            SizedBox(height: 10.h),
            _buildExpandableSection(
              title: 'Cancellation Policy',
              content: 'You can cancel up to 24 hours in advance of the experience for a full refund. For a full refund, you must cancel at least 24 hours before the experience’s start time. If you cancel less than 24 hours before the experience’s start time, the amount you paid will not be refunded.',
              isExpanded: isPolicyExpanded,
              onTap: () => _toggleExpandableSection('policy'),
            ),
            SizedBox(height: 30.h),
            _buildBookNowButton(context),
            SizedBox(height: 30.h),
            RelatedListWidget(relatedList: widget.relatedList),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Column(
      children: [
        SizedBox(height: 10.h),
        const StackImage(
          imageUrl: 'assets/best_selling/header.png',
          tripName: 'The Egyptian Gulf (Hospice of the Sultan)',
        ),
        SizedBox(height: 10.h),
        const ButtonList(),
      ],
    );
  }

  Widget _buildBookNowButton(BuildContext context) {
    return CustomButton(
      text: 'Book Now',
      onPressed: () {
        context.pushNamed(Routes.paymentScreen);
      },
      backgroundColor: AppColors.orange,
      width: 358.w,
    );
  }

  void _toggleExpandableSection(String section) {
    setState(() {
      if (section == 'tour') {
        isTourExpanded = !isTourExpanded;
      } else if (section == 'policy') {
        isPolicyExpanded = !isPolicyExpanded;
      }
    });
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
