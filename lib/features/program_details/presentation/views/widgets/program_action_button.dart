import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/action_button.dart';

class ProgramActionButtons extends StatelessWidget {
  const ProgramActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.verticalSpace,
            Row(
              children: [
                ActionButton(
                  onTap: () {},
                  text: 'Add to Wishlist',
                  svg: 'assets/svgs/heart.svg',
                ),
                60.horizontalSpace,
                ActionButton(
                  onTap: () {},
                  text: 'Map',
                  svg: 'assets/svgs/map.svg',
                ),
              ],
            ),
            ActionButton(
              onTap: () {},
              text: 'Watch Video',
              svg: 'assets/svgs/video.svg',
            ),
          ],
        ),
      ),
    );
  }
}
