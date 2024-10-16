import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomStarRating extends StatelessWidget {
  final double rating;

  const CustomStarRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 22.w,
      ratingWidget: RatingWidget(
        full: const Icon(Icons.star, color: Colors.orange),
        half: Stack(
          children: [
            Icon(Icons.star_border, color: Colors.orange),
            ClipRect(
              clipper: _HalfClipper(),
              child: Icon(Icons.star, color: Colors.orange),
            ),
          ],
        ),
        empty: const Icon(Icons.star_border, color: Colors.orange),
      ),
      onRatingUpdate: (rating) {},
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
