import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/reset_pass/reset_password_form.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/reset_pass/reset_password_header.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ResetPasswordHeader(),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ResetPasswordForm(),
            ),
          ],
        ),
      ),
    );
  }
}
