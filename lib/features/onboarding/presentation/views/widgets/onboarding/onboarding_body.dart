import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/resources/styles.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'onboarding_info.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  int currentIndex = 0;
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  void navigateToPage(int pageIndex) {
    controller.jumpToPage(pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: controller,
        itemCount: contents.length,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (_, i) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  contents[i].image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Positioned(
                top: 620.h,
                left: 35.w,
                right: 35.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      contents[i].titlePart1,
                      style: TextStyles.onboardingTitleStyle,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      contents[i].titlePart2,
                      style: TextStyles.onboardingTitleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 694.h,
                left: 25.w,
                right: 25.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      contents[i].description1,
                      style: TextStyles.onboardingDescriptionStyle,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                    Text(
                      contents[i].description2,
                      style: TextStyles.onboardingDescriptionStyle,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 750.h,
                left: 158.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contents.length,
                    (index) => Container(
                      height: 3.h,
                      width: 17.w,
                      margin: EdgeInsets.only(right: 12.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == currentIndex
                            ? TextColors.white
                            : TextColors.mediumGrey,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 775.h,
                left: 47.w,
                right: 47.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.homeScreen);
                      },
                      child: Container(
                        width: 140.w,
                        height: 37.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: TextColors.mediumGrey,
                          borderRadius: BorderRadius.circular(29),
                          border: Border.all(
                            color: TextColors.darkGrey,
                            width: 1.5.w,
                          ),
                        ),
                        child: Text(
                          'Skip',
                          style: TextStyles.font16WhiteRegular
                              .copyWith(fontFamily: 'Inter'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    GestureDetector(
                      onTap: () {
                        if (currentIndex == contents.length - 1) {
                          context.pushNamed(Routes.homeScreen);
                        } else {
                          navigateToPage(currentIndex + 1);
                        }
                      },
                      child: Container(
                        width: 140.w,
                        height: 37.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: TextColors.white,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyles.font16BlackRegular
                              .copyWith(fontFamily: 'Inter'),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
