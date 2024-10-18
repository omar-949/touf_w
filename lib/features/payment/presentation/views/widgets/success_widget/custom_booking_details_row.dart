import 'package:flutter/material.dart';

import '../../../../../../core/resources/styles.dart';

class BookingDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final MainAxisAlignment? mainAxisAlignment;
  final TextStyle? textStyle;

  const BookingDetailRow({
    super.key,
    required this.label,
    required this.value,
    this.mainAxisAlignment,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyles.font18grey500Medium),
        Text(value, style: textStyle ?? TextStyles.font18darkGreyMedium),
      ],
    );
  }
}
