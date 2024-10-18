import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/supplement/supplement_image_and_desc.dart';

import '../../../../../../core/resources/styles.dart';

class SupplementListViewItem extends StatelessWidget {
  const SupplementListViewItem(
      {super.key, required this.desc, required this.price});
  final String desc;
  final int price;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SupplementImageAndDesc(desc: desc),
      16.verticalSpace,
      Text(
        "$price EGP",
        style: TextStyles.font18darkBlueSemiBold,
      ),
    ]);
  }
}
