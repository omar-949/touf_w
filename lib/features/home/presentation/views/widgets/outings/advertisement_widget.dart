import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/routing/routes.dart';
import 'package:toufwshouf/core/widgets/custom_button.dart';

import '../../../../../../core/resources/assets.dart';

class AdvertisementWidget extends StatelessWidget {
  const AdvertisementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // height: 132.h,
        width: 360.w,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.advertisement),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Planning a vacation?",
              style: TextStyle(fontSize: 20.sp, color: Colors.white),
            ),
            Text(
              "Choose your holiday packages.",
              style: TextStyle(fontSize: 18.sp, color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () {
                _showAlertDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                minimumSize: Size(103.w, 32.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
              ),
              child: Text(
                "Book",
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Account Required',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Don\'t have an account? Sign Up now or Sign In if you already have one.',
                style: TextStyle(fontSize: 16.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButton(
                    text: 'Sign Up',
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Navigate to Sign Up screen
                      context.pushNamed(Routes.signupScreen);
                    },
                    backgroundColor: AppColors.orange,
                    width: 120.w,
                  ),
                  CustomButton(
                    text: 'Sign In',
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Navigate to Sign In screen
                      context.pushNamed(Routes.loginScreen);
                    },
                    backgroundColor: Colors.grey,
                    width: 120.w,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
