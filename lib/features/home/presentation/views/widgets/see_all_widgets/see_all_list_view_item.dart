import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/see_all_widgets/see_all_container_for_item.dart';

import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/widgets/app_horizontal_list_view_item.dart';

class SeeAllListViewItem extends StatelessWidget {
  const SeeAllListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 8.h),
      child: SizedBox(
        height: 109.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SeeAllContainerForItem(),
            16.horizontalSpace,
            Expanded(
              child: ItemDetails(
                title: 'The Egyptian Gulf (Hospice of the Sultan)',
                rating: 3.2,
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
