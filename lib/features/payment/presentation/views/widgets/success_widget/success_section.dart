import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/success_widget/booking_success_button.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/success_widget/success_section_details.dart';

class SuccessSection extends StatelessWidget {
  const SuccessSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.sp),
      child: Column(
        children: [
          const SuccessSectionDetails(),
          SizedBox(height: 20.h),
          const BookingSuccessButton(),
        ],
      ),
    );
  }
}
