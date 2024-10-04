import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/OnboardingInfo.dart';

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
                child: Text(
                  contents[i].title,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Positioned(
                top: 694.h,
                left: 25.h,
                right: 25.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      contents[i].description1,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                    Text(
                      contents[i].description2,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Inter',
                        color: Colors.white,
                        fontSize: 16.sp,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 750.h,
                left: 158.h,
                right: 158.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contents.length,
                        (index) => Container(
                      height: 3.h,
                      width: 17.w,
                      margin: EdgeInsets.only(right: 7.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: index == currentIndex
                            ? const Color(0xffFFFFFF)
                            : const Color(0xff777777),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.animateToPage(
                          contents.length - 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeOut,
                        );
                      },
                      child: Container(
                        width: 140.h,
                        height: 37.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xff777777),
                          borderRadius: BorderRadius.circular(29),
                          border: Border.all(
                            color: const Color(0xff303030),
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: const Color(0xffFFFFFF),
                            fontFamily: 'Inter',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (currentIndex == contents.length - 1) {
                          // GoRouter.of(context).go('/signup');
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        }
                      },
                      child: Container(
                        width: 140.h,
                        height: 37.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 25.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFFFFF),
                          borderRadius: BorderRadius.circular(29),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: const Color(0xff000000),
                            fontFamily: 'Inter',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
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
