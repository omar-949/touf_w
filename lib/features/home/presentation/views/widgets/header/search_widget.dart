import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/resources/styles.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 25.h), // إضافة مسافة من الجانبين
      child: Container(
        height: 36.h,
        width: 318.w,
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search for...',
            contentPadding: EdgeInsets.only(top: 5.h),
            prefixIcon: Icon(Icons.search, color: TextColors.mediumGrey, size: 24.sp),
            hintStyle: TextStyles.font16MediumGreyRegular, // تنسيق نص الحقل
            filled: true,
            fillColor: TextColors.white,
            // تغيير لون الحدود إلى لون الخلفية
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0.r),
              borderSide: BorderSide(color: TextColors.white), // تغيير اللون إلى لون الخلفية
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: TextColors.white, // تغيير اللون إلى لون الخلفية
              ),
              borderRadius: BorderRadius.circular(8.0.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: TextColors.white, // تغيير اللون إلى لون الخلفية
              ),
              borderRadius: BorderRadius.circular(8.0.r),
            ),
          ),
        ),
      ),
    );
  }
}
