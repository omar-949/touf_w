import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/home/data/models/active_program_model/active_program_model.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/stack_image_payment.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/step_indicator.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/success_widget/success_section.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/passenger_data_widgets/pay_and_back_details_button.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/check_policy_payment.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/confirm_booking_widgets/payment_method_widget.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/custom_app_bar.dart';
import 'booking_view_body_bloc_builder.dart';

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key, required this.activeProgramModel});

  final ActiveProgramModel activeProgramModel;

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  int currentStep = 1;
  bool showPaymentText = false;
  final ScrollController _scrollController = ScrollController();
  bool agreeToTerms = false;

  void _onPayButtonPressed() {
    if (agreeToTerms) {
      setState(() {
        currentStep = 2;
        showPaymentText = true;
      });

      Future.delayed(const Duration(milliseconds: 300), () {
        _scrollToPaymentMethod();
      });
    } else {
      // Display a SnackBar message if terms are not agreed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You must agree to the terms and conditions'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _scrollToPaymentMethod() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 500),
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
    return SafeArea(
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SafeArea(child: CustomAppBar()),
            StackImagePayment(
              activeProgramModel: widget.activeProgramModel,
            ),
            24.verticalSpace,
            StepIndicator(currentStep: currentStep),
            24.verticalSpace,
            if (currentStep == 3)
              const SuccessSection()
            else ...[
              const BookingViewBodyBlocBuilder(),
              10.verticalSpace,
              CheckPolicyPayment(
                validator: (value) {
                  if (value != true) {
                    return 'You must agree to the terms and conditions.';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onAgreeChanged: (bool value) {
                  setState(() {
                    agreeToTerms = value;
                  });
                },
              ),
              24.verticalSpace,
              PayDetailsButton(
                agreeToTerms: agreeToTerms,
                onPressedBuy: _onPayButtonPressed,
                onPressedAddToCard: () {},
              ),
              if (showPaymentText)
                PaymentMethodWidget(
                  onConfirmPressed: _onConfirmButtonPressed,
                  onBackPressed: _onBackButtonPressed,
                ),
            ],
          ],
        ),
      ),
    );
  }
}
