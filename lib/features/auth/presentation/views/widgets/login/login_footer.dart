import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {},
          child: Text(
            "Forget Password?",
            style: TextStyles.font14Blue500Medium,
          ),
        ),
        30.verticalSpace,
        GestureDetector(
          onTap: () {},
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "First time here? ",
                  style: TextStyles.font14Grey700Medium,
                ),
                TextSpan(
                  text: "Sign up for free",
                  style: TextStyles.font14Blue500Bold,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}