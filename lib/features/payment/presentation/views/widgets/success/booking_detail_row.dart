import 'package:flutter/material.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class BookingDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const BookingDetailRow({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyles.font18grey500Medium),
        Text(value, style: TextStyles.font18darkGreyMedium),
      ],
    );
  }
}
