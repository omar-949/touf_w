import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/widgets/rating.dart';

class ProgramDetailsHeader extends StatelessWidget {
  const ProgramDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 280.h,
      toolbarHeight: 0,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/home/bestselling1.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'The Egyptian Gulf (Hospice of the Sultan)',
                  style: TextStyles.font18WhiteMedium,
                ),
                10.verticalSpace,
                CustomStarRating(rating: 4.5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
