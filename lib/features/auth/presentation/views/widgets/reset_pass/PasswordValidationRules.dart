import 'package:flutter/material.dart';

class PasswordValidationRules extends StatelessWidget {
  final bool isValidLength;
  final bool hasUppercase;
  final bool hasLowercase;
  final bool hasNumber;

  const PasswordValidationRules({
    Key? key,
    required this.isValidLength,
    required this.hasUppercase,
    required this.hasLowercase,
    required this.hasNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ValidationRule(rule: "At least 8 characters", isValid: isValidLength),
        _ValidationRule(rule: "At least one uppercase letter", isValid: hasUppercase),
        _ValidationRule(rule: "At least one lowercase letter", isValid: hasLowercase),
        _ValidationRule(rule: "At least one number", isValid: hasNumber),
      ],
    );
  }
}

class _ValidationRule extends StatelessWidget {
  final String rule;
  final bool isValid;

  const _ValidationRule({
    Key? key,
    required this.rule,
    required this.isValid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.cancel,
          color: isValid ? Colors.green : Colors.red,
        ),
        const SizedBox(width: 8),
        Text(
          rule,
          style: TextStyle(
            color: isValid ? Colors.green : Colors.red,
          ),
        ),
      ],
    );
  }
}
