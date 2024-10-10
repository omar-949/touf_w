import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/styles.dart';
import 'supplement_icon.dart';


class SupplementRow extends StatelessWidget {
  final String description;
  final String price;

  const SupplementRow({
    super.key,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SupplementIcon(image: "assets/best_selling/supplement.png"),
            SizedBox(width: 10.w),
            Text(
              description,
              style: TextStyles.font16DarkGreyRegular,
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Text(
          price,
          style: TextStyles.font18darkBlueRegular.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
