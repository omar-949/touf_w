import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors.dart';
import '../../../../../core/resources/styles.dart';
import '../../../../../core/widgets/custom_button.dart';

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
            shrinkWrap:
                true,
            physics:
                NeverScrollableScrollPhysics(),
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              final review = reviews[index];
              return _buildReview(
                username: review['username'],
                rating: review['rating'],
                reviewText: review['reviewText'],
                imageUrl:
                    review['ImageUrl'],
              );
            },
          ),
          SizedBox(
            height: 20.h,
          ),
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
        SizedBox(
          height: 20.h,
        ),
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
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        CustomButton(
          text: 'Submit',
          onPressed: () {},
          backgroundColor: AppColors.orange,
          width: 158.w,
        )
      ],
    );
  }

  Widget _buildReview({
    required String username,
    required double rating,
    required String imageUrl,
    required String reviewText,
  }) {
    return Container(
      width: 287.w,
      height: 80.h,
      child: Row(
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(username, style: TextStyles.font19darkGrayMedium),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < rating ? Icons.star : Icons.star,
                          color: AppColors.orange,
                          size: 16.sp,
                        );
                      }),
                    ),
                  ],
                ),
                Text(reviewText, style: TextStyles.font16DarkGreyRegular),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
