import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/forget_pass/forget_pass_bloc.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/forget_pass/forget_pass_header.dart';

class ForgetPassBody extends StatelessWidget {
  const ForgetPassBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ForgetPassHeader(),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const ForgetPassBloc(),
            ),
          ],
        ),
      ),
    );
  }
}
