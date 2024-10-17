import 'package:flutter/material.dart';
import 'package:toufwshouf/core/widgets/rating.dart';

import '../../../../../../core/resources/styles.dart';

class HotelsRatingSection extends StatelessWidget {
  const HotelsRatingSection({super.key, required this.title, required this.rating});
  final String title;
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(title, style: TextStyles.font20darkGreySemiBold),
      Spacer(),
      CustomStarRating(rating: rating),
    ]);
  }
}
