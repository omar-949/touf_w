import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/payment/data/models/program_date_and_number_model/program_date_and_number_model.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/container_data.dart';

class BookingDateAndTime extends StatelessWidget {
  const BookingDateAndTime({
    super.key,
    required this.programDateAndNumber,
  });
  final ProgramDateAndNumberModel programDateAndNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ContainerDate(
          iconPath: 'assets/payment/lets-icons_date-today.png',
          label: "Trip date:",
          date: programDateAndNumber.progGrpFrom ?? "No Date",
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
