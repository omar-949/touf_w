import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  final String logoAsset;
  final String imageAsset;

  const Header({
    super.key,
    required this.imageAsset,
    required this.logoAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLogo(context),
        _buildImage(context),
      ],
    );
  }

  Widget _buildImage(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.asset(
        imageAsset,
        fit: BoxFit.cover,
        height: 255.56.h,
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, top: 16.h),
      child: Image.asset(
        logoAsset,
        width: 100.w,
        height: 48.39.h,
      ),
    );
  }
}
