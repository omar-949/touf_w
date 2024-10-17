import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';
import 'package:toufwshouf/core/widgets/custom_image_container.dart';
import 'package:toufwshouf/core/widgets/rating.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/hotels/hotels_location_and_details_for_container.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/hotels/hotels_price_section.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/hotels/hotels_rating_section.dart';

import '../../../../../../core/resources/assets.dart';

class HotelsContainerDetails extends StatelessWidget {
  const HotelsContainerDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageContainer(height: 195.54, width: 334),
        12.verticalSpace,
        HotelsRatingSection(title: "City hostel", rating: 4.1),
        12.verticalSpace,
        HotelsLocationAndDetailsForContainer(),
        12.verticalSpace,
        HotelsPriceSection(),
        25.verticalSpace,
        CustomButton(text: "More Details",textStyle: TextStyles.font16WhiteMedium, onPressed: (){}),
      ],
    );
  }
}
