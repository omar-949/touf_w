import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/reset_pass/reset_password_bloc_listener.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/reset_pass/reset_password_header.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody({super.key, required this.otp, required this.transNo, required this.email});
  final String otp;
  final int transNo;
  final String email;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const ResetPasswordHeader(),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ResetPasswordBlocListener(otp: otp, transNo: transNo, email: email),
            ),
          ],
        ),
      ),
    );
  }
}
