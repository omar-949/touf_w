import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupplementIcon extends StatelessWidget {
  final String image;

  const SupplementIcon({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24.w,
      height: 25.h,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
