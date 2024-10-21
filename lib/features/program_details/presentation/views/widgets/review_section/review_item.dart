import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/program_details/data/models/reviews_model/reviews_model.dart';

import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/widgets/rating.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key, required this.reviews});

  final ReviewsModel reviews;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: screenWidth * 0.2,
              height: 80.h,
              child: Image.asset(
                "assets/home/Mask Group 6.png",
                fit: BoxFit.fill,
              ),
            ),
          ),

          16.horizontalSpace, // Space between image and text

          // Text and Rating
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        reviews.customer ?? '',
                        style: TextStyles.font19darkGrayMedium,
                      ),
                    ),
                    CustomStarRating(rating: reviews.rate?.toDouble() ?? 0.0),
                    // Rating widget
                  ],
                ),

                5.verticalSpace, // Space between name and text

                // Review Text
                Text(
                  reviews.review ?? '',
                  style: TextStyles.font16grey400Regular
                      .copyWith(color: const Color(0xff333333)),
                ),
                SizedBox(
                  height: 12.h,
                ),
                const Divider(
                  thickness: 1, // Thickness of the divider
                  color: Color(0xffC7C7C7), // Color of the divider
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
