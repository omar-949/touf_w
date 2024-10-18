import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/widgets/custom_image.dart';

import '../resources/styles.dart';
import 'app_horizontal_list_view_item.dart';

class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer(
      {super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return CustomImage(
      width: width,
      height: height,
      borderRadius: BorderRadius.circular(12.r),
      url: 'assets/home/bestselling1.png',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PriceTag(
            price: 850,
            textStyle: TextStyles.font14OrangeSemiBold,
          ),
        ],
      ),
    );
  }
}
