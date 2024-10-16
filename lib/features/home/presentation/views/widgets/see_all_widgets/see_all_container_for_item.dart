import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/widgets/app_horizontal_list_view_item.dart';
class SeeAllContainerForItem extends StatelessWidget {
  const SeeAllContainerForItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 109.h,
      width: 181.w,
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
