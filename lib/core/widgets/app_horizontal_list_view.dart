import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppHorizontalListView extends StatelessWidget {
  const AppHorizontalListView({super.key, required this.item});
  final Widget item;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 216.h,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return item;
        },
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
      ),
    );
  }
}
