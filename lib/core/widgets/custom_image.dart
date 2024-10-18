import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.width,
    required this.height,
    required this.url,
    this.borderRadius,
    this.child,
  });

  final double width;
  final double height;
  final String url;
  final BorderRadius? borderRadius;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      decoration: BoxDecoration(
        color: Colors.red,
        image: DecorationImage(image: AssetImage(url), fit: BoxFit.fill),
        borderRadius: borderRadius ?? BorderRadius.circular(0.r),
      ),
      child: child,
    );
  }
}
