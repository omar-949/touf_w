import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/resources/styles.dart';

class StackImage extends StatefulWidget {
  const StackImage({
    super.key,
    required this.imageUrl,
    required this.tripName,
  });

  final String imageUrl;
  final String tripName;

  @override
  State<StackImage> createState() => _StackImageState();
}

class _StackImageState extends State<StackImage> {
  double _rating = 4.5;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          width: 390.w,
          height: 294.68.h,
          child: Image.asset(
            widget.imageUrl, // Dynamic image
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey,
                child: const Center(
                  child: Icon(
                    Icons.broken_image,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
        // Overlay with opacity
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        // Title and Rating Bar
        Positioned(
          top: 200.h,
          left: 16.h,
          right: 16.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.tripName,
                style: TextStyles.font18WhiteMedium,
                maxLines: 2,
              ),
              SizedBox(height: 10.h),
              RatingBar.builder(
                initialRating: _rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 16.sp,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: AppColors.orange,
                ),
                onRatingUpdate: (rating) {
                  setState(() {
                    _rating = rating;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
