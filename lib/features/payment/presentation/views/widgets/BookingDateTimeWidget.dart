import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/container_data.dart';

class BookingDateTimeWidget extends StatelessWidget {
  final bool bookingSuccess;

  const BookingDateTimeWidget({
    Key? key,
    required this.bookingSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (bookingSuccess) return SizedBox.shrink();

    return Column(
      children: [
        DateContainer(
          iconPath: 'assets/payment/lets-icons_date-today.png',
          label: "Trip date:",
          date: "2/3/2022",
        ),
        SizedBox(height: 10.h), // Optional: Add spacing between date and time
        DateContainer(
          iconPath: 'assets/payment/clock.png',
          label: "Time:",
          date: "18:00",
        ),
      ],
    );
  }
}
