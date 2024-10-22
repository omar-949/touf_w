import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class CheckPolicyPayment extends StatefulWidget {
  const CheckPolicyPayment({super.key});

  @override
  State<CheckPolicyPayment> createState() => _CheckPolicyPaymentState();
}

class _CheckPolicyPaymentState extends State<CheckPolicyPayment> {
  bool agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "The total includes VAT",
            style: TextStyles.font20OrangeMedium,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                side: const BorderSide(color: TextColors.grey600),
                activeColor: TextColors.darkBlue,
                value: agreeToTerms,
                onChanged: (value) {
                  setState(() {
                    agreeToTerms =
                        value ?? false;
                  });
                },
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 14.h),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyles.font14darkGreyRegular,
                      children: [
                        TextSpan(
                            text:
                                "I Accept Terms And Conditions and Cancellation policy ",
                            style: TextStyles.font18DarkGreyRegular
                                .copyWith(color: Colors.black)),
                        TextSpan(
                            text: "Read Terms and conditions",
                            style: TextStyles.font18DarkGreyRegular
                                .copyWith(color: TextColors.darkBlue)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
