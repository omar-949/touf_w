import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/code_validation/code_validation_bloc_listener.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/code_validation/code_validation_header.dart';

class CodeValidationBody extends StatelessWidget {
  const CodeValidationBody(
      {super.key, required this.email, required this.phone});
  final String email;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CodeValidationHeader(),
            40.verticalSpace,
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CodeValidationBlocListener(email: email, phone: phone)),
          ],
        ),
      ),
    );
  }
}
