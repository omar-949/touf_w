import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';
import 'package:toufwshouf/core/widgets/rating_widget.dart';

import '../../../../../../core/resources/assets.dart';
import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/resources/styles.dart';
import '../../../../../../core/widgets/custom_container_details.dart';

class CustomContainerHotel extends StatelessWidget {
  const CustomContainerHotel(
      {super.key,
      required this.imageUrl,
      required this.containerText2,
      required this.containerSalary2,
      required this.textHeader,
      required this.textDesc,
      required this.textCheck,
      required this.textDate,
      required this.rate});
  final String imageUrl;
  final String containerText2;
  final String containerSalary2;
  final String textHeader;
  final String textDesc;
  final String textCheck;
  final String textDate;
  final double rate;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 482.h,
        width: 358.w,
        margin: EdgeInsets.only(bottom: 10.h),
        padding:
            EdgeInsets.only(top: 8.h, left: 12.w, bottom: 8.h, right: 12.w),
        decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: TextColors.lightGrey2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomContainerDetails(
              image: imageUrl,
              tripName: null,
              rating: 4.5,
              height: 196.h,
              width: 334.w,
              containerText1: containerText2,
              containerSalary1: containerSalary2,
              isNotNeed: true,
            ),
            SizedBox(
                width: 334.w,
                child: Text(
                  textHeader,
                  style: TextStyles.font18darkGreySemiBold,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
            SizedBox(
                width: 316.w,
                child: Text(
                  textDesc,
                  style: TextStyles.font14LightGreyMedium,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildRowDetails(
                    imageUrl: Assets.check, text: textCheck),
                SizedBox(
                  width: 35.w,
                ),
                _buildRowDetails(imageUrl: Assets.clockTime, text: textDate)
              ],
            ),
            _buildMoreDetailsRow(),
            SizedBox(
              height: 15.h,
            ),
            CustomButton(
              text: "Price varies by group size",
              onPressed: () {},
              radius: 5.r,
              width: 334.w,
              height: 44.h,
              backgroundColor: TextColors.darkBlue,
              textStyle: TextStyles.font14lightWhite500Medium,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRowDetails({required String imageUrl, required String text}) {
    return Row(
      children: [
        Image.asset(
          imageUrl,
        ),
        SizedBox(
          width: 8.w,
        ),
        Text(
          text,
          style: TextStyles.font14darkBlue500Medium,
        )
      ],
    );
  }

  Widget _buildMoreDetailsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
            text: "More Details",
            onPressed: () {},
            backgroundColor: AppColors.orange,
            radius: 5.r,
            width: 174.w,
            height: 40.h),
        CustomRatingWidget(rating: rate)
      ],
    );
  }
}
