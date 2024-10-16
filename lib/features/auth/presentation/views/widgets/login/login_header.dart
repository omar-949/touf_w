import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/header.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Header(
          logoAsset: "assets/logo_en 2.png",
          imageAsset: "assets/auth/login.png",
        ),
        10.verticalSpace,
        Text("Login", style: TextStyles.font26GreyExtraBold),
        6.verticalSpace,
        Center(
          child: Text(
            "Welcome back! Please enter your details.",
            style: TextStyles.font14GreyMedium,
          ),
        ),
      ],
    );
  }
}
