import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'container_data.dart';

class BookingDateTimeWidget extends StatelessWidget {
  final bool bookingSuccess;

  const BookingDateTimeWidget({
    super.key,
    required this.bookingSuccess,
  });

  @override
  Widget build(BuildContext context) {
    if (bookingSuccess) return const SizedBox.shrink();

    return Column(
      children: [
        const DateContainer(
          iconPath: 'assets/payment/lets-icons_date-today.png',
          label: "Trip date:",
          date: "2/3/2022",
        ),
        SizedBox(height: 10.h),
        const DateContainer(
          iconPath: 'assets/payment/clock.png',
          label: "Time:",
          date: "18:00",
        ),
      ],
    );
  }
}
