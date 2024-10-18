import 'package:flutter/material.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/custom_check_box.dart';
class SavePaymentDetails extends StatefulWidget {
  const SavePaymentDetails({super.key});

  @override
  State<SavePaymentDetails> createState() => _SavePaymentDetailsState();
}

class _SavePaymentDetailsState extends State<SavePaymentDetails> {
  bool agreeToTerms = false;
  @override
  Widget build(BuildContext context) {
    return   Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomCheckbox(
          value: agreeToTerms,
          onChanged: (value) {
            setState(() {
              agreeToTerms = value ?? false;
            });
          },
        ),
        const SizedBox(width: 5,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(right: 70),
            child: Text(
              "Save my payment details for future booking ",
              style: TextStyles.font14darkGreyRegular,
            ),
          ),
        ),
      ],
    );
  }
}
