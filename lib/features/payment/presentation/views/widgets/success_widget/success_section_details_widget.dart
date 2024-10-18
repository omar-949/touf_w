import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/success_widget/custom_booking_details_row.dart';

class SuccessSectionDetailsWidget extends StatelessWidget {
  const SuccessSectionDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("The Egyptian Gulf", style: TextStyles.font20BlackMedium),
        SizedBox(height: 16.h),
        const BookingDetailRow(
          label: "Booking date:",
          value: "2/3/2022",
        ),
        SizedBox(height: 11.h),
        const BookingDetailRow(
          label: "Trip Date:",
          value: "2/3/2022 at 18:00",
        ),
        SizedBox(height: 13.h),
        BookingDetailRow(
          textStyle: TextStyles.font18grey500Medium,
          mainAxisAlignment: MainAxisAlignment.start,
          label: "Egyptians Number ",
          value: "1",
        ),
        SizedBox(height: 13.h),
        BookingDetailRow(
          textStyle: TextStyles.font18grey500Medium,
          mainAxisAlignment: MainAxisAlignment.start,
          label: "Children Number ",
          value: "1",
        ),
        SizedBox(height: 13.h),
        Text(
          "Total without additional services  ",
          style: TextStyles.font18grey500Medium,
        ),
        SizedBox(
          height: 15.h,
        ),
        Align(
            alignment: Alignment.centerRight,
            child: Text(
              " 440 EGP",
              style: TextStyles.font18darkGreyMedium,
            )),
        SizedBox(
          height: 11.h,
        ),
        const BookingDetailRow(
          label: "Total:",
          value: " 440 EGP",
        ),
        SizedBox(
          height: 11.h,
        ),
        const BookingDetailRow(
          label: "VAT:",
          value: "17 EGP",
        ),
        SizedBox(height: 11.h),
        BookingDetailRow(
          textStyle: TextStyles.font22darkGreyMedium
              .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
          label: "The total includes VAT:",
          value: "457 EGP",
        ),
        SizedBox(height: 24.h),
        Center(
          child: Text(
            "Cancellation Deadline: 10/3/2022",
            style: TextStyles.font18red500Medium,
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
