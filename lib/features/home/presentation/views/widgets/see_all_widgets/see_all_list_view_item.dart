import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/widgets/custom_image.dart';
import 'package:toufwshouf/features/home/data/models/active_program_model/active_program_model.dart';

import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/widgets/app_horizontal_list_view_item.dart';

class SeeAllListViewItem extends StatelessWidget {
  const SeeAllListViewItem({super.key, required this.programModel});

  final ActiveProgramModel programModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.h),
      child: SizedBox(
        height: 109.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CustomCachedNetworkImage(
                  width: 180,
                  height: 110,
                  url: programModel.imgPath ?? '',
                ),
                PriceTag(
                  price: programModel.startprice ?? 0,
                ),
              ],
            ),
            16.horizontalSpace,
            Expanded(
              child: ItemDetails(
                title: programModel.programname ?? '',
                rating: double.tryParse(programModel.rateReview ?? 'No Review') ?? 0.0,
                textStyle: TextStyles.font16BlackMedium,
                isSpacer: true,
                verticalSpace: 0,
                horizontalSpace: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
