import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/widgets/header_widget.dart';

class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Header(
          logoAsset: "assets/logo_en 2.png",
          imageAsset: "assets/auth/reset_pass.png",
        ),
        10.verticalSpace,
        Center(
          child: Text(
            "Reset Password",
            style: TextStyles.font26GreyExtraBold,
          ),
        ),
      ],
    );
  }
}
