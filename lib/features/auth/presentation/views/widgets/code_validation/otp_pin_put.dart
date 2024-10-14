import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class OtpPinPut extends StatelessWidget {
  const OtpPinPut({
    super.key,
    required this.otpController,
    required this.onCompleted,
  });

  final TextEditingController otpController;
  final void Function(String) onCompleted;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      textStyle: TextStyles.font20BlackMedium,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey200,
        ),
        borderRadius: BorderRadius.circular(12.r),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: AppColors.blue500,
        width: 1.4,
      ),
      borderRadius: BorderRadius.circular(16.r),
    );
    final errorPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(
        color: Colors.red,
      ),
      borderRadius: BorderRadius.circular(12.r),
    );
    return Pinput(
      controller: otpController,
      length: 6,
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      errorPinTheme: errorPinTheme,
      onCompleted: (value) => onCompleted(value),
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "OTP cannot be empty!";
        } else if (value.length < 6) {
          return "Please enter a valid OTP";
        }
        return null; // Return null if the value is valid
      },
    );
  }
}
