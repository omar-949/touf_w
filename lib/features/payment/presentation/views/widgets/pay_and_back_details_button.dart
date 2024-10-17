import 'package:flutter/material.dart';

import '../../../../../core/resources/colors.dart';
import '../../../../../core/widgets/custom_button.dart';
class PayDetailsButton extends StatelessWidget {
  const PayDetailsButton({super.key, this.onPressedBuy, this.onPressedAddToFavorite});
  final void Function()? onPressedBuy;
  final void Function()? onPressedAddToFavorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          CustomButton(text: "Buy",
            textColor: TextColors.white,
            backGroundColor: AppColors.orange,
            onPressed:onPressedBuy ,
          ),
          SizedBox(height: 24,),
          CustomButton(
            text: "Add to my shopping cart",
            textColor: TextColors.orange,
            backGroundColor: Colors.transparent,
            onPressed:onPressedAddToFavorite,
          ),
        ],
      ),
    );
  }
}
