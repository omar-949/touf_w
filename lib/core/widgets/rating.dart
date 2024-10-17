import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toufwshouf/core/resources/assets.dart';

class CustomStarRating extends StatelessWidget {
  final double rating;

  const CustomStarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    // Calculate the appropriate star rating
    double adjustedRating;

    if (rating % 1 <= 0.5 && rating % 1 >= 0.2) {
      // If the rating is exactly .5 (like 4.5), keep it as is
      adjustedRating = rating;
    } else {
      // Round normally
      adjustedRating = rating.roundToDouble();
    }

    return RatingBar(
      initialRating: adjustedRating,
      // Use the adjusted rating here
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 24.w,
      ratingWidget: RatingWidget(
        full: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.5.w),
          child: SvgPicture.asset(Assets.starFull),
        ),
        half: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.5.w),
          child: SvgPicture.asset(Assets.starHalf),
        ),
        empty: Padding(
          padding: EdgeInsets.symmetric(horizontal: 1.5.w),
          child: SvgPicture.asset(Assets.starEmpty),
        ),
      ),
      onRatingUpdate: (rating) {
        // Handle the rating update if needed
      },
    );
  }
}

class _HalfClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0.0, 0.0, size.width / 2, size.height);
  }

  @override
  bool shouldReclip(_HalfClipper oldClipper) {
    return false;
  }
}
