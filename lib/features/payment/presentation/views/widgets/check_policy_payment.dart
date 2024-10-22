import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/passenger_data_widgets/custom_check_box.dart';

class CheckPolicyPayment extends FormField<bool> {
  CheckPolicyPayment({
    super.key,
    super.onSaved,
    super.validator,
    bool super.initialValue = false,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
    required ValueChanged<bool> onAgreeChanged,
  }) : super(
    builder: (FormFieldState<bool> state) {
      return Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "The total includes VAT",
              style: TextStyles.font20OrangeMedium,
            ),
             SizedBox(height: 16.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCheckbox(
                  value: state.value ?? false,
                  onChanged: (bool? newValue) {
                    state.didChange(newValue ?? false);
                    onAgreeChanged(newValue ?? false);
                  },
                  activeColor: TextColors.darkBlue,
                  checkColor: Colors.white,
                  borderColor: TextColors.grey600,
                  size: 24.0,
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: TextStyles.font14darkGreyRegular,
                      children: [
                        TextSpan(
                          text:
                          "I Accept Terms And Conditions and Cancellation policy ",
                          style: TextStyles.font18DarkGreyRegular
                              .copyWith(color: Colors.black),
                        ),
                        TextSpan(
                          text: "Read Terms and conditions",
                          style: TextStyles.font18DarkGreyRegular
                              .copyWith(color: TextColors.darkBlue),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (state.hasError)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  state.errorText!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      );
    },
  );
}
