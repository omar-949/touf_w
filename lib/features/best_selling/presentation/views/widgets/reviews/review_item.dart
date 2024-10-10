import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/resources/styles.dart';

class ReviewItem extends StatelessWidget {
  final String username;
  final double rating;
  final String imageUrl;
  final String reviewText;

  const ReviewItem({
    required this.username,
    required this.rating,
    required this.imageUrl,
    required this.reviewText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 287.w,
      height: 80.h,
      child: Row(
        children: [
          SizedBox(
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
                          index < rating ? Icons.star : Icons.star_border,
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
