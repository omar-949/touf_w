import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';

import '../../../../../core/resources/assets.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_container_details.dart';
import '../../../../../core/widgets/horzintal_lists_view_widget.dart';
import '../../../../../core/widgets/list_view_header.dart';
import 'advertisement_widget.dart';

class OutingsBody extends StatelessWidget {
  OutingsBody({super.key});

  final List<CustomContainerDetails> bestSellingList = [
    CustomContainerDetails(
      image: Assets.bestSelling1,
      tripName: "The Egyptian Gulf (Hospice of the Sultan)",
      rating: 4.5,
      containerText1: 'Start From',
      containerSalary1: '850 EGP',
    ),
    CustomContainerDetails(
      image: Assets.bestSelling2,
      tripName: "The Egyptian Gulf (Hospice of the Sultan)",
      rating: 4.5,
      containerText1: 'Start From',
      containerSalary1: '850 EGP',
    ),
  ];

  final List<CustomContainerDetails> bestOfferList = [
    CustomContainerDetails(
      image: Assets.bestOffer1,
      tripName: "The Egyptian Gulf (Hospice of the Sultan)",
      rating: 4.5,
      containerText1: '1000EGP',
      containerSalary1: '850 EGP',
      isDashed1: true,
    ),
    CustomContainerDetails(
      image: Assets.bestOffer2,
      tripName: "The Egyptian Gulf (Hospice of the Sultan)",
      rating: 4.5,
      containerText1: '1000EGP',
      containerSalary1: '850 EGP',
      isDashed1: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(bottom: 250.h),  // Optional padding to add spacing around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeader(
              title: "Best Selling",
              onSeeAllPressed: () {
                context.pushNamed(Routes.BestSellingScreen);
              },
            ),
            TripsListView(tripsList: bestSellingList),

            SectionHeader(title: "Advertisements"),
            const AdvertisementWidget(),

            SectionHeader(title: "Best Offer"),
            TripsListView(tripsList: bestOfferList),

            SectionHeader(title: "Partners"),
            _buildPartners(),
          ],
        ),
      ),
    );
  }

  Widget _buildPartners() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(Assets.partners1, height: 52.h, width: 108.w),
        Image.asset(Assets.partners2, height: 52.h, width: 108.w),
        Image.asset(Assets.partners3, height: 52.h, width: 108.w),
      ],
    );
  }
}
