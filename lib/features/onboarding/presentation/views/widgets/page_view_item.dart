import 'package:flutter/material.dart';
import 'package:toufwshouf/core/resources/assets.dart';
import 'package:toufwshouf/features/onboarding/data/models/carousel_item_model.dart';

import 'onboarding_text.dart';

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
      ],
    );
  }
}
