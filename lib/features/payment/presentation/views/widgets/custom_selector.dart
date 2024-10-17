import 'package:flutter/material.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/custom_counter_widget.dart';

import '../../../../../core/resources/styles.dart';

class CountSelector extends StatelessWidget {
  final String label;
  final String price;

  final int count;
  final Function() onAdd;
  final Function() onRemove;

  const CountSelector({
    super.key,
    required this.label,
    required this.price,
    required this.count,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style:
                  TextStyles.font16Grey500Medium.copyWith(color: Colors.black),
            ),
            CustomCounterWidget(
              count: count,
              onAdd: onAdd,
              onRemove: onRemove,
            )
          ],
        ),
        Text(
          price,
          style: TextStyles.font14darkBlue500Medium,
        ),
      ],
    );
  }
}
