import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/widgets/header_widget.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(
          logoAsset: "assets/logo_en 2.png",
          imageAsset: "assets/auth/sign_up.png",
        ),
        Padding(
          padding: EdgeInsets.only(top: 17.h),
          child: Center(
            child: Text(
              "Sign up",
              style: TextStyles.font26GreyExtraBold
                  .copyWith(fontFamily: 'Montserrat'),
            ),
          ),
        ),
        6.verticalSpace,
        Center(
          child: Text(
            "Hello there! Let’s create your account.",
            style:
                TextStyles.font14GreyMedium.copyWith(fontFamily: 'Montserrat'),
          ),
        ),
      ],
    );
  }
}
