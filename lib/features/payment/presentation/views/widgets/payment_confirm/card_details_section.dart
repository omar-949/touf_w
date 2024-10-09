import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/resources/styles.dart';

class CardDetailsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Credit Card", style: TextStyles.font16darkGreySemiBold),
        TextField(
          decoration: InputDecoration(
            hintText: '3485 ****  ****  ****',
            hintStyle: TextStyles.font14lightGreyRegular,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: TextColors.lightGrey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: TextColors.lightGrey,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.orange,
                width: 1.0,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          ),
        ),
        SizedBox(height: 10.h), // Spacing between fields
        Text("Name on card", style: TextStyles.font16darkGreySemiBold),
        TextField(
          decoration: InputDecoration(
            hintText: 'Joe Doe',
            hintStyle: TextStyles.font14lightGreyRegular,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: TextColors.lightGrey,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(
                color: Colors.orange,
                width: 1.0,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          ),
        ),
      ],
    );
  }
}
