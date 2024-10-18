import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/overview/expandable_container.dart';

class TourDetails extends StatelessWidget {
  const TourDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            const ExpandableContainer(
              title: 'Tour Including',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Suspendisse malesuada lacus ex, sit amet blandit leo lobortis eget.',
            ),
            12.verticalSpace,
            const ExpandableContainer(
              title: 'Cancellation policy',
              description:
                  'You can cancel up to 24 hours in advance of the experience for a full refund. For a full refund, you must cancel at least 24 hours before the experience’s start time.If you cancel less than 24 hours before the experience’s start time, the amount you paid will not be refunded. Any changes made less than 24 hours before the experience’s start time will not be accepted. Cut-off times are based on theexperience’s local time.',
            ),
          ],
        ),
      ),
    );
  }
}
