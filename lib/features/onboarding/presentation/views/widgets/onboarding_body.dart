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
              // Background Image
              Positioned.fill(
                child: Image.asset(
                  contents[i].image,
                  fit: BoxFit.cover, // Cover the entire screen
                ),
              ),
              // Overlay with background color and opacity
              Container(
                color: Colors.black.withOpacity(0.5), // Semi-transparent overlay
              ),
              // Main content column
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Text(
                      contents[i].title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp, // Adjusted font size for title
                        fontWeight: FontWeight.bold, // Bold title
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  // Description
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40.w),
                    child: Text(
                      contents[i].description,
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize: 18.sp, // Adjusted font size for description
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  // Dots indicator
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      contents.length,
                          (index) => Container(
                        height: currentIndex == index ? 12.h : 8.h,
                        width: currentIndex == index ? 12.w : 8.w,
                        margin: EdgeInsets.only(right: 7.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index == currentIndex
                              ? const Color(0xffF04C29)
                              : const Color(0xff82573f),
                        ),
                      ),
                    ),
                  ),
                  // Next button
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.h),
                    child: GestureDetector(
                      onTap: () {
                        if (currentIndex == contents.length - 1) {
                          // GoRouter.of(context).go('/signup');
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                          setState(() {
                            currentIndex++;
                          });
                        }
                      },
                      child: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: const BoxDecoration(
                          color: Color(0xff20473E),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Color(0xffFFFFFF),
                          size: 32,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
