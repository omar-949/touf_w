import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class BookingSuccessWidget extends StatelessWidget {
  const BookingSuccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(

          width: 358.w,
          margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          padding: EdgeInsets.all(16.sp),
          decoration: BoxDecoration(

            color: TextColors.lightwhite,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(10.2/100),
                spreadRadius: 0,
                blurRadius: 12,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            children: [
              Center(
                child: Image.network('assets/payment/Icon awesome-check-circle.png'),
              ),
              SizedBox(height: 10.h), // Optional: Adds space between the image and the text
              Text(
                "Booking Successful",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5.h), // Adds spacing between texts
              Text(
                "Thank you for Choosing Touf w shof",
                style: TextStyles.font16grey400Regular,
              ),
              SizedBox(height: 20.h), // Adds space between sections
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "The Egyptian Gulf",
                    style: TextStyles.font20darkGreyMedium,
                  ),
                  SizedBox(height: 10.h), // Adds space between the text and rows
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Booking date",style: TextStyles.font18grey500Medium,),
                      Text("2/3/2022",style:  TextStyles.font18darkGreyMedium,),
                      // Add content inside this Row based on your need
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Trip Date",style: TextStyles.font18grey500Medium),
                      Text("2/3/2022 at 18:00",style:  TextStyles.font18darkGreyMedium,),
                      // Add content inside this Row based on your need
                    ],
                  ),
                  Text("Egyptians Number 1",style: TextStyles.font18grey500Medium),
                  Text("Children Number 1",style: TextStyles.font18grey500Medium),
                  Text("Total without additional services",style: TextStyles.font18grey500Medium),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(""),
                      Text("440 EGP",style:  TextStyles.font18darkGreyMedium,),
                      // Add content inside this Row based on your need
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",style: TextStyles.font18grey500Medium),
                      Text("440 EGP",style:  TextStyles.font18darkGreyMedium,),
                      // Add content inside this Row based on your need
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("VAT",style: TextStyles.font18grey500Medium),
                      Text("17 EGP",style:  TextStyles.font18darkGreyMedium,),
                      // Add content inside this Row based on your need
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("The total includes VAT",style: TextStyles.font18grey500Medium),
                      Text("457 EGP",style:  TextStyles.font22darkGreyMedium,),
                      // Add content inside this Row based on your need
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Center(child: Text("Cancellation Deadline: 10/3/2022",style: TextStyles.font18red500Medium,)),
                  SizedBox(height: 10.h,),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h,),
        SizedBox(
          width: 358.w,
          height: 42.h,
          child: ElevatedButton(
            onPressed: () {

            },
            style: ElevatedButton.styleFrom(
              backgroundColor: TextColors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(3.r)),
              ),
              elevation: 0,
            ),
            child: Text("Make anthor booking", style: TextStyles.font18WhiteMedium),
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: 358.w,
          height: 42.h,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(3.r)),
                side: BorderSide(color: Colors.orange, width: 1.0),
              ),
              elevation: 0,
            ),
            child: Text("Return home",
                style: TextStyles.font18OrangeMedium),
          ),
        ),
      ],
    );
  }
}
