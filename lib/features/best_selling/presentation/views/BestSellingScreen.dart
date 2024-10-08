import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/styles.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_container_details.dart';
import '../../../../core/widgets/rating_widget.dart';

class BestSellingScreen extends StatelessWidget {
  const BestSellingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Best Selling",
        route: '/homeScreen',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView.builder(
          itemCount: 15,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomContainerDetails(
                    image: 'assets/best_selling/Mask Group 4 1.png',
                    tripName: 'The Egyptian Gulf (Hospice of the Sultan)',
                    rating: 4.5,
                    containerText1: 'Start From',
                    containerSalary1: '850 EGP',
                    height: 109.h,
                    width: 181.w,
                    isNotNeed: true,
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The Egyptian Gulf (Hospice of the Sultan)',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font16BlackMedium,
                        ),
                        SizedBox(height: 50.h),
                        CustomRatingWidget(rating: 4.5),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
