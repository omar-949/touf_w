import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/program_details/presentation/views/widgets/overview/expandable_container.dart';

class OverviewTabBarContent extends StatelessWidget {
  const OverviewTabBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'A journey through history starting from the gates of Fatimid Cairo at Bab al-Futuh, passing through our monuments and stories of  Egyptian history and heritage From Bab Al-Futuh, through the story of Sidi El-Zouk, passing by Al-Hakim Mosque, Bamir Allah, to the house of Al-Suhaimi ** Prices include: * Entrance tickets * Arab guide * Prices do not include any meals or drinks',
            style: TextStyles.font16BlackRegular,
          ),
          16.verticalSpace,
          Text(
            'Additional Info',
            style: TextStyles.font18MediumDarkGreyMedium,
          ),
          8.verticalSpace,
          Text(
            'Return Details Returns to original departure point Departure Point 77 Salah Salem, Al Omraneyah Ash Sharqeyah, Giza District, Giza Governorate, Egypt As per requested time our tour guide will be waiting in the lobby of your hotel and he will be holding a sign showing your name on it',
            style: TextStyles.font16BlackRegular,
          ),
          12.verticalSpace,
          ExpandableContainer(
            title: 'Tour Including',
            description:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Suspendisse malesuada lacus ex, sit amet blandit leo lobortis eget.',
          ),
          12.verticalSpace,
          ExpandableContainer(
            title: 'Cancellation policy',
            description:
                'You can cancel up to 24 hours in advance of the experience for a full refund. For a full refund, you must cancel at least 24 hours before the experience’s start time.If you cancel less than 24 hours before the experience’s start time, the amount you paid will not be refunded. Any changes made less than 24 hours before the experience’s start time will not be accepted. Cut-off times are based on theexperience’s local time.',
          ),
        ],
      ),
    );
  }
}
