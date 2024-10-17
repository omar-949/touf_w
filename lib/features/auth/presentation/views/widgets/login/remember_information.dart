import 'package:flutter/material.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class RememberInformation extends StatefulWidget {
  const RememberInformation({
    super.key,
  });

  @override
  State<RememberInformation> createState() => _RememberInformationState();
}

class _RememberInformationState extends State<RememberInformation> {
  bool isChecked = false;

  void _onCheckboxChanged(bool? newValue) {
    setState(() {
      isChecked = newValue ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: _onCheckboxChanged,
          checkColor: Colors.white,
          activeColor: AppColors.blue500,
          side: const BorderSide(
            color: AppColors.grey200,
            width: 1.3,
          ),
        ),
        Text(
          "Remember Information",
          style: TextStyles.font14Grey600Medium,
        ),
      ],
    );
  }
}
