import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/widgets/rating.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({super.key});

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
                        "Ahmed kamel",
                        style: TextStyles.font19darkGrayMedium,
                      ),
                    ),
                    const CustomStarRating(rating: 3.5), // Rating widget
                  ],
                ),

                5.verticalSpace, // Space between name and text

                // Review Text
                Text(
                  "Lorem ipsum dolor sit amet, cum sapientem honestatis ea, verear ",
                  style: TextStyles.font16grey400Regular
                      .copyWith(color: const Color(0xff333333)),
                ),
                SizedBox(
                  height: 12.h,
                ),
                const Divider(
                    thickness: 1, // Thickness of the divider
                    color: Color(0xffC7C7C7) // Color of the divider
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
