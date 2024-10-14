import 'package:flutter/material.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class AgreeToPolicies extends FormField<bool> {
  AgreeToPolicies({
    super.key,
    super.onSaved,
    super.validator,
    bool super.initialValue = false,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
  }) : super(
          builder: (FormFieldState<bool> state) {
            return Column(
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: state.value ?? false,
                      onChanged: (bool? newValue) {
                        state.didChange(newValue ?? false);
                      },
                      checkColor: Colors.white,
                      activeColor: AppColors.blue500,
                      side: BorderSide(
                        color: state.hasError ? Colors.red : AppColors.grey200,
                        width: 1.3,
                      ),
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'I agree to the Platform ',
                              style: TextStyles.font14Grey600Regular,
                            ),
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyles.font14Blue500Bold,
                            ),
                            TextSpan(
                              text: ' and ',
                              style: TextStyles.font14Grey600Regular,
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyles.font14Blue500Bold,
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
            );
          },
        );
}
