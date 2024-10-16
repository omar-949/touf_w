import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/header.dart';

class CodeValidationHeader extends StatelessWidget {
  const CodeValidationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(
          logoAsset: "assets/logo_en 2.png",
          imageAsset: "assets/auth/code_validation.png",
        ),
        10.verticalSpace,
        Text(
          "Code validation",
          style: TextStyles.font26GreyExtraBold,
        ),
        10.verticalSpace,
        Text(
          "Please enter the 6 digit code sent to your sms or email",
          textAlign: TextAlign.center, // Center the text
          style: TextStyles.font14GreyMedium,
        ),
      ],
    );
  }
}
