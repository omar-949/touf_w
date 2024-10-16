import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/widgets/app_horizontal_list_view.dart';
import 'package:toufwshouf/core/widgets/app_horizontal_list_view_item.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/home_section_header.dart';

class BestOfferProgram extends StatelessWidget {
  const BestOfferProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeSectionHeader(
          section: "Best Offer",
          isSeeAll: true,
        ),
        10.verticalSpace,
        AppHorizontalListView(
          item: AppHorizontalListViewItem(),
        ),
      ],
    );
  }
}
