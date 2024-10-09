import 'package:flutter/material.dart';
import '../../../../../core/resources/colors.dart';
import '../../../../../core/resources/styles.dart';

class CheckboxTermsSection extends StatelessWidget {
  final ValueChanged<bool?>? onCheckboxChanged; // Updated to accept null

  CheckboxTermsSection({required this.onCheckboxChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          side: BorderSide(color: TextColors.grey600),
          activeColor: TextColors.darkBlue,
          value: false,
          onChanged: onCheckboxChanged
        ),
        Text("Save my payment details for future booking ", style: TextStyles.font14darkGreyRegular),
      ],
    );
  }
}
