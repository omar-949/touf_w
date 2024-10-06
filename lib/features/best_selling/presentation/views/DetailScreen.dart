import 'package:flutter/material.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/widgets/custom_appbar.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';
import 'package:toufwshouf/features/best_selling/presentation/views/widgets/lable_button.dart';
import 'package:toufwshouf/features/best_selling/presentation/views/widgets/expandable_section.dart';
import 'package:toufwshouf/features/best_selling/presentation/views/widgets/info_box.dart';
import 'package:toufwshouf/features/best_selling/presentation/views/widgets/overview_widget.dart';
import 'package:toufwshouf/features/best_selling/presentation/views/widgets/stack_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Best Selling',
        route: '',
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            _buildHeaderImage(),
            SizedBox(height: 10.h),
            _buildActionButtons(),
            SizedBox(height: 20.h),
            const InfoBox(),
            SizedBox(height: 20.h),
            _buildCustomTabBar(),
            _buildTabBarView(),
            _buildExpandableSection(
              title: 'Tour Including',
              content:
              'The tour includes entrance tickets and an Arab guide. It does not include meals or drinks.',
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
              'You can cancel up to 24 hours in advance of the experience for a full refund. Any cancellations made less than 24 hours will not be refunded.',
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

  Widget _buildHeaderImage() {
    return StackImage(
      imageUrl: 'assets/best_selling/header.png',
      tripName: 'The Egyptian Gulf (Hospice of the Sultan)',
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildLabelButton(
              label: 'Add to Wishlist',
              imagePath: 'assets/best_selling/whishlest.png',
            ),
            SizedBox(width: 60.w),
            _buildLabelButton(
              label: 'Map',
              imagePath: 'assets/best_selling/map.png',
            ),
          ],
        ),
        SizedBox(height: 5.h),
        _buildLabelButton(
          label: 'Watch Video',
          imagePath: 'assets/best_selling/watch.png',
        ),
      ],
    );
  }

  Widget _buildLabelButton({required String label, required String imagePath}) {
    return LableButton(
      label: label,
      imagePath: imagePath,
      onPressed: () {
        // Add your functionality here
      },
    );
  }

  Widget _buildCustomTabBar() {
    return TabBar(
      controller: _tabController,
      labelColor: AppColors.orange,
      unselectedLabelColor: Colors.black54,
      indicatorColor: AppColors.orange,
      indicatorWeight: 2.0,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: TextStyles.font18MediumGreyMedium,
      unselectedLabelStyle: TextStyles.font18MediumGreyMedium,
      tabs: const [
        Tab(text: 'Overview'),
        Tab(text: 'Supplement'),
        Tab(text: 'Photo Gallery'),
      ],
    );
  }

  Widget _buildTabBarView() {
    return SizedBox(
      height: 500.h,
      child: TabBarView(
        controller: _tabController,
        children: const [
          OverviewWidget(
            overviewMainText:
            'A journey through history starting from the gates of Fatimid Cairo at Bab al-Futuh, passing through our monuments and stories of Egyptian history and heritage. From Bab Al-Futuh, through the story of Sidi El-Zouk, passing by Al-Hakim Mosque, Bamir Allah, to the house of Al-Suhaimi. ** Prices include: * Entrance tickets * Arab guide * Prices do not include any meals or drinks.',
            additionalInfo:
            'Return Details Returns to original departure point Departure Point 77 Salah Salem, Al Omraneyah Ash Sharqeyah, Giza District, Giza Governorate, Egypt As per requested time our tour guide will be waiting in the lobby of your hotel and he will be holding a sign showing your name on it',
          ),
          Center(child: Text('Supplement Content')),
          Center(child: Text('Photo Gallery Content')),
        ],
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
