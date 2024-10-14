import 'package:flutter/material.dart';
import 'package:toufwshouf/features/auth/presentation/views/widgets/code_validation/code_validation_body.dart';

class CodeValidationView extends StatelessWidget {
  const CodeValidationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CodeValidationBody(),
    );
  }
}
