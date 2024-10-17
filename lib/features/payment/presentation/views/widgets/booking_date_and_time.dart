import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/container_data.dart';

class BookingDateAndTime extends StatelessWidget {
  const BookingDateAndTime({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ContainerDate(
          iconPath: 'assets/payment/lets-icons_date-today.png',
          label: "Trip date:",
          date: "2/3/2022",
        ),
        SizedBox(height: 16.h),
        const ContainerDate(
          iconPath: 'assets/payment/clock.png',
          label: "Time:",
          date: "18:00",
        ),
      ],
    );
  }
}
