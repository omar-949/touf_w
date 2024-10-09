import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets.dart';

class AdvertisementWidget extends StatelessWidget {
  const AdvertisementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132.h,
      width: 360.w,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.advertisement),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Planning a vacation?",
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
          Text(
            "Choose your holiday packages.",
            style: TextStyle(fontSize: 18.sp, color: Colors.white),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Book",
              style: TextStyle(fontSize: 18.sp, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              minimumSize: Size(110.w, 32.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
