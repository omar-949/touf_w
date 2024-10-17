import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/payment_method_widget.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/booking_date_and_time.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/booking_section.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/check_policy_payment.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/custom_app_bar.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/pay_and_back_details_button.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/stack_image_payment.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/step_indicator.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/success_widget/success_section.dart';
class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key});

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  int currentStep = 1;
  bool showPaymentText = false;
  final ScrollController _scrollController = ScrollController();

  void _onPayButtonPressed() {
    setState(() {
      currentStep = 2;
      showPaymentText = true;
    });

    Future.delayed(Duration(milliseconds: 300), () {
      _scrollToPaymentMethod();
    });
  }

  void _scrollToPaymentMethod() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _onBackButtonPressed() {
    setState(() {
      currentStep = 1;
      showPaymentText = false;
    });
  }

  void _onConfirmButtonPressed() {
    setState(() {
      currentStep = 3;
      showPaymentText = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController, // Assign ScrollController
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SafeArea(child: CustomAppBar()),
          const StackImagePayment(),
          24.verticalSpace,
          StepIndicator(currentStep: currentStep),
          24.verticalSpace,

          if (currentStep == 3)
            const SuccessSection()
          else ...[
            const BookingDateAndTime(),
            24.verticalSpace,
            const BookingSection(),
            10.verticalSpace,
            const CheckPolicyPayment(),
            24.verticalSpace,
            PayDetailsButton(
              onPressedBuy: _onPayButtonPressed,
              onPressedAddToCard: () {},
            ),
            if (showPaymentText)
              PaymentMethodWidget(
                onConfirmPressed: _onConfirmButtonPressed,
                onBackPressed: _onBackButtonPressed,
              ),
          ]
        ],
      ),
    );
  }
}
