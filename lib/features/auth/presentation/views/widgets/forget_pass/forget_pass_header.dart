import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/widgets/header_widget.dart';

class ForgetPassHeader extends StatelessWidget {
  const ForgetPassHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(
          logoAsset: "assets/logo_en 2.png",
          imageAsset: "assets/auth/forget_pass.png",
        ),
        10.verticalSpace,
        Text(
          "Forgot password?",
          style: TextStyles.font26GreyExtraBold,
        ),
        10.verticalSpace,
        Text(
          "Don’t worry! It happens. Please enter the email address associated with your account.",
          textAlign: TextAlign.center,
          style: TextStyles.font14GreyMedium,
        ),
      ],
    );
  }
}
