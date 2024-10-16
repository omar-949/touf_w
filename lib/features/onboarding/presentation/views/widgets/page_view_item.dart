import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/assets.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/onboarding/data/models/carousel_item_model.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.index,
  });

  final int index;
  static const List<OnboardingItemModel> onboardingItem = [
    OnboardingItemModel(
      title: 'Embark On Your Simple Travel Experience',
      subTitle: 'Enjoy a Smooth, stress-free travel Journey with ease and simplicity every step.',
      image: Assets.onboarding1,
    ),
    OnboardingItemModel(
      title: 'Embark On Your Simple Travel Experience',
      subTitle: 'Enjoy a Smooth, stress-free travel Journey with ease and simplicity every step.',
      image: Assets.onboarding2,
    ),
    OnboardingItemModel(
      title: 'Embark On Your Simple Travel Experience',
      subTitle: 'Enjoy a Smooth, stress-free travel Journey with ease and simplicity every step.',
      image: Assets.onboarding3,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          onboardingItem[index].image,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 110.h,
          left: 36.w,
          right: 36.w,
          child: Column(
            children: [
              Text(
                onboardingItem[index].title,
                style: TextStyles.font24WhiteSemiBold,
                textAlign: TextAlign.center,
              ),
              6.verticalSpace,
              Text(
                onboardingItem[index].subTitle,
                style: TextStyles.font16WhiteRegular,
                textAlign: TextAlign.center,
              ),
              10.verticalSpace,
            ],
          ),
        ),
      ],
    );
  }
}
