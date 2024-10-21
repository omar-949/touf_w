import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/program_details/data/models/tour_including_model/tour_including_model.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/overview/expandable_container.dart';

class TourDetails extends StatelessWidget {
  const TourDetails({
    super.key,
    required this.tourIncludingModel,
  });

  final TourIncludingModel tourIncludingModel;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Column(
          children: [
            ExpandableContainer(
              title: 'Tour Including',
              description: tourIncludingModel.tourIncludin ?? '',
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
