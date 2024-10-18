import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class OverviewTabBarContent extends StatelessWidget {
  const OverviewTabBarContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
          ),Text(
            'Return Details Returns to original departure point Departure Point 77 Salah Salem, Al Omraneyah Ash Sharqeyah, Giza District, Giza Governorate, Egypt As per requested time our tour guide will be waiting in the lobby of your hotel and he will be holding a sign showing your name on it',
            style: TextStyles.font16BlackRegular,
          ),Text(
            'Return Details Returns to original departure point Departure Point 77 Salah Salem, Al Omraneyah Ash Sharqeyah, Giza District, Giza Governorate, Egypt As per requested time our tour guide will be waiting in the lobby of your hotel and he will be holding a sign showing your name on it',
            style: TextStyles.font16BlackRegular,
          ),Text(
            'Return Details Returns to original departure point Departure Point 77 Salah Salem, Al Omraneyah Ash Sharqeyah, Giza District, Giza Governorate, Egypt As per requested time our tour guide will be waiting in the lobby of your hotel and he will be holding a sign showing your name on it',
            style: TextStyles.font16BlackRegular,
          ),Text(
            'Return Details Returns to original departure point Departure Point 77 Salah Salem, Al Omraneyah Ash Sharqeyah, Giza District, Giza Governorate, Egypt As per requested time our tour guide will be waiting in the lobby of your hotel and he will be holding a sign showing your name on it',
            style: TextStyles.font16BlackRegular,
          ),
        ],
      ),
    );
  }
}
