import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';
class HotelsPriceSection extends StatelessWidget {
  const HotelsPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '170.66 EGP / person',
          style: TextStyles.font16DarkGreyMedium,
        ),
        Spacer(),
        CustomButton(text: "Price for 2 nights", backgroundColor: TextColors.darkBlue, textStyle: TextStyles.font14lightWhite500Medium, onPressed: (){}),
      ],
    );
  }
}
