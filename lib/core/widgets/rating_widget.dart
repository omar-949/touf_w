import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/assets.dart';

class CustomRatingWidget extends StatefulWidget {
  CustomRatingWidget({super.key, required this.rating});
    double rating;

  @override
  State<CustomRatingWidget> createState() => _CustomRatingWidgetState();
}

class _CustomRatingWidgetState extends State<CustomRatingWidget> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: widget.rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 16.sp,
      itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
      itemBuilder: (context, _) => SvgPicture.asset(Assets.star),
      onRatingUpdate: (rating) {
        setState(() {
          widget.rating = rating;
        });
      },
    );
  }
}
