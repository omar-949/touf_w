import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'info_row.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      height: 188.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(1, 0),
            blurRadius: 6,
            spreadRadius: 0,
          ),
        ],
      ),
      padding: EdgeInsets.all(12.w),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoRow(
            imageUrl: 'assets/best_selling/Vector (3).png',
            labelName: 'Location:',
            value: 'Egypt, Cairo',
          ),
          InfoRow(
            imageUrl: 'assets/best_selling/svgexport-6 (82).png',
            labelName: 'Price:',
            value: '850 EGP',
          ),
          InfoRow(
            imageUrl: 'assets/best_selling/svgexport-6 (83).png',
            labelName: 'Duration time:',
            value: '3 Hour/s',
          ),
          InfoRow(
            imageUrl: 'assets/best_selling/Group 585.png',
            value: 'Walking Tour',
          ),
        ],
      ),
    );
  }
}
