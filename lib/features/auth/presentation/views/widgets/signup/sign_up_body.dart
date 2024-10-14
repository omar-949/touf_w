import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/signup/sign_up_footer.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/signup/sign_up_form.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/signup/sign_up_header.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SignUpHeader(),
            10.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SignUpForm(),
            ),
            8.verticalSpace,
            SignUpFooter(),
            26.verticalSpace,
          ],
        ),
      ),
    );
  }
}
