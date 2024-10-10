import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';

class InfoRow extends StatelessWidget {
  final String imageUrl;
  final String? labelName;
  final String value;

  const InfoRow({
    super.key,
    required this.imageUrl,
    this.labelName,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0, top: 6, bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 24.w,
            height: 24.h,
            child: Image.asset(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(width: 25.w),
          if (labelName != null)
            Text(labelName!, style: TextStyles.font16LightGreyRegular),
          Text(value, style: TextStyles.font16DarkGreyRegular),
        ],
      ),
    );
  }
}
