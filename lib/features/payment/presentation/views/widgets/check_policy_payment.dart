import 'package:flutter/material.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/custom_check_box.dart';

class CheckPolicyPayment extends StatefulWidget {
  const CheckPolicyPayment({super.key});

  @override
  State<CheckPolicyPayment> createState() => _CheckPolicyPaymentState();
}

class _CheckPolicyPaymentState extends State<CheckPolicyPayment> {
  bool agreeToTerms = false; // Variable to track checkbox state

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
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
              CustomCheckbox(
                  value: agreeToTerms,
                onChanged: (value) {
                  setState(() {
                    agreeToTerms = value ?? false; // Update state when checkbox changes
                  });
                },
              ),
              SizedBox(width: 10,),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    style: TextStyles.font14darkGreyRegular,
                    children:  [
                      TextSpan(
                          text:
                          "I Accept Terms And Conditions and Cancellation policy ",
                          style: TextStyles.font18DarkGreyRegular.copyWith(color: Colors.black)),
                      TextSpan(
                          text: "Read Terms and conditions",
                          style: TextStyles.font18DarkGreyRegular.copyWith(color:TextColors.darkBlue )),
                    ],
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
