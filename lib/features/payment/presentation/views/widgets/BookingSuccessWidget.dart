import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import '../../../../../core/resources/colors.dart';
import '../../../../../core/resources/styles.dart';
import 'booking_detail_row.dart'; // Import the BookingDetailRow
import 'booking_success_container.dart'; // Import the BookingSuccessContainer

class BookingSuccessWidget extends StatelessWidget {
  const BookingSuccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bookingDetails = [
      BookingDetailRow(label: "Booking date", value: "2/3/2022"),
      BookingDetailRow(label: "Trip Date", value: "2/3/2022 at 18:00"),
      BookingDetailRow(label: "Egyptians Number", value: "1"),
      BookingDetailRow(label: "Children Number", value: "1"),
      BookingDetailRow(label: "Total without additional services", value: "440 EGP"),
      BookingDetailRow(label: "Total", value: "440 EGP"),
      BookingDetailRow(label: "VAT", value: "17 EGP"),
      BookingDetailRow(label: "The total includes VAT", value: "457 EGP"),
      Center(child: Text("Cancellation Deadline: 10/3/2022", style: TextStyles.font18red500Medium)),
    ];

    return Column(
      children: [
        BookingSuccessContainer(
          title: "Booking Successful",
          message: "Thank you for Choosing Touf w shof",
          details: bookingDetails,
        ),
        SizedBox(height: 20.h),
        _buildActionButton(context, "Make another booking", Routes.paymentScreen, TextColors.orange),
        SizedBox(height: 10.h),
        _buildActionButton(context, "Return home", Routes.homeScreen, Colors.transparent, isOutlined: true),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, String title, String route, Color color, {bool isOutlined = false}) {
    return SizedBox(
      width: 358.w,
      height: 42.h,
      child: ElevatedButton(
        onPressed: () {
          context.pushNamed(route);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutlined ? Colors.transparent : color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3.r)),
            side: isOutlined ? BorderSide(color: Colors.orange, width: 1.0) : BorderSide.none,
          ),
          elevation: 0,
        ),
        child: Text(title, style: isOutlined ? TextStyles.font18OrangeMedium : TextStyles.font18WhiteMedium),
      ),
    );
  }
}
