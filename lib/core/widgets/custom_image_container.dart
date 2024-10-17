import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/styles.dart';
import 'app_horizontal_list_view_item.dart';
class CustomImageContainer extends StatelessWidget {
  const CustomImageContainer({super.key, required this.height, required this.width});
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      width: width.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.red,
        image: const DecorationImage(
          // Todo: Replace with CachedNetworkImageProvider if needed
          image: AssetImage('assets/home/bestselling1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PriceTag(
            price: '850',
            textStyle: TextStyles.font14OrangeSemiBold,
          ),
        ],
      ),
    );
  }
}
