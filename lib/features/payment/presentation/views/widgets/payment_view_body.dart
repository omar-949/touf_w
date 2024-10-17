import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/Payment_method_widget.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/booking_date_and_time.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/booking_section.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/check_policy_payment.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/custom_app_bar.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/pay_and_back_details_button.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/stack_image_payment.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/step_indicator.dart';

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key});
  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  int currentStep = 1;
  bool showPaymentText = false;

  void _onPayButtonPressed() {
    setState(() {
      currentStep = 2;
      showPaymentText = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SafeArea(child: CustomAppBar()),
          const StackImagePayment(),
          SizedBox(height: 24.h),
          StepIndicator(currentStep: currentStep), // Step indicator now updates
          SizedBox(height: 24.h),
          const BookingDateAndTime(),
          SizedBox(height: 24.h),
          const BookingSection(),
          SizedBox(height: 10.h),
          const CheckPolicyPayment(),
          PayDetailsButton(
            onPressedBuy: _onPayButtonPressed,
            onPressedAddToFavorite: () {},
          ),
          if (showPaymentText) // Conditionally show the text based on state
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              child: PaymentMethodWidget(),
            ),
        ],
      ),
    );
  }
}
