import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/styles.dart';

class InfoRow extends StatelessWidget {
  final String imageUrl;
  final String? labelName; // Optional label name
  final String value;

  const InfoRow({
    super.key,
    required this.imageUrl,
    this.labelName, // Optional parameter
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0, top: 6, bottom: 10),
      child: Row(
        children: [
          // Display the image
          Container(
            width: 24.w,
            height: 24.h,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 12.w), // Add space between image and text

          // If labelName is provided, display it
          if (labelName != null)
            Text(labelName!, style: TextStyles.font16LightGreyRegular),

          Text(value, style: TextStyles.font16DarkGreyRegular),
        ],
      ),
    );
  }
}
