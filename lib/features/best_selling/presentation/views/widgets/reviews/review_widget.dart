import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/widgets/custom_button.dart';
import 'review_item.dart';

class ReviewsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> reviews;

  const ReviewsWidget({required this.reviews, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              final review = reviews[index];
              return ReviewItem( // Use the ReviewItem here
                username: review['username'],
                rating: review['rating'],
                reviewText: review['reviewText'],
                imageUrl: review['ImageUrl'],
              );
            },
          ),
          SizedBox(height: 20.h),
          _buildReviewInput(),
        ],
      ),
    );
  }

  Widget _buildReviewInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Write your review “The Egyptian Gulf”',
          style: TextStyles.font18DarkGreyRegular,
        ),
        SizedBox(height: 20.h),
        Text(
          'Reviews',
          style: TextStyles.font18MediumDarkGreyMedium,
        ),
        SizedBox(height: 10.h),
        Container(
          width: 358.w,
          height: 160.h,
          decoration: BoxDecoration(
            color: TextColors.light3white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Write your feedback',
              hintStyle: TextStyles.font16LightGreyRegular,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        CustomButton(
          text: 'Submit',
          onPressed: () {},
          backgroundColor: AppColors.orange,
          width: 158.w,
        ),
      ],
    );
  }
}
