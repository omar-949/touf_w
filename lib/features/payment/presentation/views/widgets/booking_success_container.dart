import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class BookingSuccessContainer extends StatelessWidget {
  final String title;
  final String message;
  final List<Widget> details;

  const BookingSuccessContainer({
    Key? key,
    required this.title,
    required this.message,
    required this.details,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        color: TextColors.lightwhite,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.102),
            spreadRadius: 0,
            blurRadius: 12,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Center(
            child: Image.asset('assets/payment/Icon awesome-check-circle.png'),
          ),
          SizedBox(height: 10.h),
          Text(
            title,
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.h),
          Text(
            message,
            style: TextStyles.font16grey400Regular,
          ),
          SizedBox(height: 20.h),
          ...details,
        ],
      ),
    );
  }
}
