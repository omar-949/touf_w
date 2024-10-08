import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/custom_container_details.dart';

import '../../../../../core/resources/assets.dart';

class OutingsBody extends StatelessWidget {
  OutingsBody({super.key});
  List bestSellingList = [
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
  List bestOfferList = [
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
      physics: NeverScrollableScrollPhysics(),
      scrollDirection:Axis.vertical ,
      child: Column(
        children: [
          _buildBestSelling(),
          _buildBestSellingListView(),
          _buildTextHeader(textHeader: 'advertisements'),
          _buildAdvertisement(),
          _buildTextHeader(textHeader: 'Best Offer'),
          _buildBestOfferListView(),
          _buildTextHeader(textHeader: 'Partners'),
          _buildPartners(),

        ],
      ),
    );
  }

  Widget _buildTextHeader({required String textHeader}) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0.w, bottom: 15.w, top: 10.h),
      child: Row(
        children: [
          Container(
            width: 5.w, // عرض الدائرة
            height: 26.h, // ارتفاع الدائرة
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: TextColors.orange, // لون الدائرة
            ),
          ),
          SizedBox(width: 8.w), // المسافة بين الدائرة والنص
          Text(textHeader, style: TextStyles.font20BlackMedium),
        ],
      ),
    );
  }

  Widget _buildAdvertisement() {
    return Container(
      height: 132.h,
      width: 360.w,
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.advertisement), fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Planning a vacation?",
            style: TextStyles.font20WhiteMedium,
          ),
          Text("Choose your holiday packages.",
              style: TextStyles.font18WhiteRegular),
          CustomButton(
              text: "Book",
              onPressed: () {},
              height: 32.h,
              width: 110.w,
              backgroundColor: AppColors.orange,
              radius: 6.r,
              textStyle: TextStyles.font18WhiteRegular),
        ],
      ),
    );
  }

  Widget _buildBestSelling() {
    return Padding(
      padding: EdgeInsets.only(right: 20.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTextHeader(textHeader: "Best Selling"),
          Text(
            "See all",
            style: TextStyles.font16BlackRegular,
          )
        ],
      ),
    );
  }

  Widget _buildBestSellingListView() {
    return SizedBox(
      height: 215.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return bestSellingList[index];
        },
        itemCount: bestSellingList.length,
      ),
    );
  }

  Widget _buildBestOfferListView() {
    return SizedBox(
      height: 215.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return bestOfferList[index];
        },
        itemCount: bestOfferList.length,
      ),
    );
  }

  Widget _buildPartners() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          Assets.partners1,
          height: 52.h,
          width: 108.w,
        ),
        Image.asset(
          Assets.partners2,
          height: 52.h,
          width: 108.w,
        ),
        Image.asset(
          Assets.partners3,
          height: 52.h,
          width: 108.w,
        ),
      ],
    );
  }
}
