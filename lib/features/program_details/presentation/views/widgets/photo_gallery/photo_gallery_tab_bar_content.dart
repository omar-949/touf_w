import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/widgets/custom_image.dart';


class PhotoGalleryTabBarContent extends StatelessWidget {
  const PhotoGalleryTabBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 16.0.h),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.only(right: 8.0.w),
            child: Column(
              children: [
                CustomImage(
                  url: "assets/home/Mask Group 6.png",
                  width: 200,
                  height: 162,
                  borderRadius: BorderRadius.circular(12),
                ),
                16.verticalSpace,
                CustomImage(
                  url: "assets/home/Mask Group 6.png",
                  width: 200,
                  height: 162,
                  borderRadius: BorderRadius.circular(12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
