import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/resources/colors.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final TextStyle labelStyle;
  final BorderSide borderSide;

  const CustomCheckbox({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.label,
    required this.labelStyle,
    this.borderSide = const BorderSide(color: TextColors.grey600),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: TextColors.darkBlue,
          side: borderSide,
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 14.h),
            child: Text(label, style: labelStyle),
          ),
        ),
      ],
    );
  }
}
