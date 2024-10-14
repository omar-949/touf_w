import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/login/login_bloc_listener.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/login/login_footer.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/login/login_form.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/login/login_header.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LoginHeader(),
            16.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: LoginBlocListener(),
            ),
            16.verticalSpace,
            LoginFooter(),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
