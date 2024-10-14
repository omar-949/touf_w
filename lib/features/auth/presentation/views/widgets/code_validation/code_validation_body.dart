import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/code_validation/code_validation_form.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/code_validation/code_validation_header.dart';

class CodeValidationBody extends StatelessWidget {
  const CodeValidationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CodeValidationHeader(),
            40.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: CodeValidationForm(),
            ),
          ],
        ),
      ),
    );
  }
}
