import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';

class SupplementWidget extends StatefulWidget {
  const SupplementWidget({super.key});

  @override
  State<SupplementWidget> createState() => _SupplementWidgetState();
}

class _SupplementWidgetState extends State<SupplementWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'The price includes supplement:',
          style: TextStyles.font18MediumDarkGreyMedium,
        ),
        SizedBox(height: 20.h),

        // Supplements List
        _buildSupplementRow(
          '12 working hours Hyundai H1 car',
          '1290 EGP',
        ),
        SizedBox(height: 20.h),

        _buildSupplementRow(
          '12 working hours Kia Carens',
          '1150 EGP',
        ),
        SizedBox(height: 20.h),

        _buildSupplementRow(
          '6 working hours Kia Carens',
          '780 EGP',
        ),
        SizedBox(height: 20.h),

        _buildSupplementRow(
          '6 working hours of Hyundai H1 car',
          '860 EGP',
        ),
        SizedBox(height: 10.h),
        Divider(),
        SizedBox(height: 10.h),
        Row(
          children: [
            _buildSupplementIcon("assets/best_selling/supplementwarn.png"),
            SizedBox(width: 10.w),
            Text(
             " All prices don't include VAT",
              style: TextStyles.font18OrangeMedium,
            ),
          ],
        ),
      ],
    );
  }
  Widget _buildSupplementRow(String description, String price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildSupplementIcon("assets/best_selling/supplement.png"),
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

  Widget _buildSupplementIcon(String image) {
    return Container(
      width: 24.w,
      height: 25.h,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
