import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';

import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/widgets/custom_button.dart';

class PayDetailsButton extends StatelessWidget {
  const PayDetailsButton(
      {super.key, this.onPressedBuy, this.onPressedAddToCard});
  final void Function()? onPressedBuy;
  final void Function()? onPressedAddToCard;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          CustomButton(
            height: 44.h,
            borderRadius: BorderRadius.circular(12),
            text: "Pay",
            backgroundColor: AppColors.orange,
            onPressed: onPressedBuy,
          ),
          SizedBox(
            height: 24.h,
          ),
          CustomButton(
            borderSideColor: AppColors.orange,
            height: 42.h,
            textStyle:
                TextStyles.font18WhiteMedium.copyWith(color: TextColors.orange),
            borderRadius: BorderRadius.circular(12),
            text: "Add to my shopping cart",
            backgroundColor: Colors.transparent,
            onPressed: onPressedAddToCard,
          ),
          SizedBox(
            height: 24.h,
          )
        ],
      ),
    );
  }
}
