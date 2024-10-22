import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/confirm_booking_widgets/conferm_booking_section.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/confirm_booking_widgets/payment_method_option_section.dart';

class PaymentMethodWidget extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onConfirmPressed;

  const PaymentMethodWidget({
    super.key,
    required this.onBackPressed,
    required this.onConfirmPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Choose payment method", style: TextStyles.font18darkGreyMedium),
          SizedBox(height: 24.h),
          const PaymentMethodOptionSection(),
          SizedBox(height: 20.h),
          ConfirmBookingSection(
            onConfirmPressed: onConfirmPressed,
            onBackPressed: onBackPressed,
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
