import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/best_selling/presentation/views/widgets/overview_widget.dart';
import 'gallery_widget.dart';
import 'review_widget.dart';
import 'supplement_widget.dart';

class TabBarViewWidget extends StatelessWidget {
  final TabController tabController;

  const TabBarViewWidget({required this.tabController, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 510.h,
      ),
      child: TabBarView(
        controller: tabController,
        children: [
          _buildOverviewTab(),
          _buildSupplementTab(),
          _buildPhotoGalleryTab(),
          _buildReviewsSection(),
        ],
      ),
    );
  }

  Widget _buildOverviewTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: const OverviewWidget(
        overviewMainText:
            'A journey through history starting from the gates of Fatimid Cairo at Bab al-Futuh, passing through our monuments and stories of Egyptian history and heritage. From Bab Al-Futuh, through the story of Sidi El-Zouk, passing by Al-Hakim Mosque, Bamir Allah, to the house of Al-Suhaimi. ** Prices include: * Entrance tickets * Arab guide * Prices do not include any meals or drinks.',
        additionalInfo:
            'Return Details Returns to original departure point Departure Point 77 Salah Salem, Al Omraneyah Ash Sharqeyah, Giza District, Giza Governorate, Egypt As per requested time our tour guide will be waiting in the lobby of your hotel and he will be holding a sign showing your name on it',
      ),
    );
  }

  Widget _buildSupplementTab() {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: SupplementWidget(),
    );
  }

  Widget _buildPhotoGalleryTab() {
    final imageUrls = [
      'assets/best_selling/Mask Group 6.png',
      'assets/best_selling/Mask Group 7.png',
      'assets/best_selling/Mask Group 9.png',
      'assets/best_selling/Mask Group 10.png',
    ];

    return PhotoGalleryWidget(imageUrls: imageUrls);
  }

  Widget _buildReviewsSection() {
    final reviews = [
      {
        'username': 'Ahmed Kamel',
        'rating': 4.5,
        'reviewText':
            'Lorem ipsum dolor sit amet, cum sapientem honestatis ea, verear ',
        'ImageUrl': 'assets/best_selling/Frame 110.png'
      },
      {
        'username': 'Noha Mohamed',
        'rating': 5.0,
        'reviewText':
            'Lorem ipsum dolor sit amet, cum sapientem honestatis ea, verear ',
        'ImageUrl': 'assets/best_selling/Frame 111.png'
      },
    ];

    return Padding(
      padding: EdgeInsets.all(16.w),
      child: ReviewsWidget(reviews: reviews),
    );
  }
}
