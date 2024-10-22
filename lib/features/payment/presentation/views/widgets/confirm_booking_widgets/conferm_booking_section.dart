import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/confirm_booking_widgets/custom_text_form_field_pay.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/confirm_booking_widgets/save_payment_details.dart';

class ConfirmBookingSection extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onConfirmPressed;

  const ConfirmBookingSection({
    super.key,
    required this.onBackPressed,
    required this.onConfirmPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Credit Card", style: TextStyles.font16darkGreySemiBold),
        SizedBox(height: 8.h),
        const CustomTextFormFieldPay(hintText: " '3485 ****  ****  ****',"),
        SizedBox(height: 15.h),
        Text("Name on card", style: TextStyles.font16darkGreySemiBold),
        const SizedBox(height: 8),
        const CustomTextFormFieldPay(hintText: "Joe Doe"),
        SizedBox(height: 15.h),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Expiration date",
                      style: TextStyles.font16darkGreySemiBold),
                  const SizedBox(height: 8),
                  const CustomTextFormFieldPay(hintText: "MM/YY"),
                ],
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("CVV", style: TextStyles.font16darkGreySemiBold),
                  const SizedBox(height: 8),
                  const CustomTextFormFieldPay(hintText: "123"),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        const SavePaymentDetails(),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: CustomButton(
                onPressed:
                    onConfirmPressed,
                height: 52.h,
                text: "Confirm",
                borderRadius: BorderRadius.circular(2.r),
                textStyle: TextStyles.font16WhiteMedium,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomButton(
                borderSideColor: Colors.orange,
                backgroundColor: Colors.white,
                textStyle: TextStyles.font16WhiteMedium
                    .copyWith(color: TextColors.orange),
                onPressed:
                    onBackPressed,
                height: 50.h,
                borderRadius: BorderRadius.circular(2.r),
                text: "Back",
              ),
            ),
          ],
        ),
      ],
    );
  }
}
