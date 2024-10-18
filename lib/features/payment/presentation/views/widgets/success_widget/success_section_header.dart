import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/styles.dart';

class SuccessSectionHeader extends StatelessWidget {
  const SuccessSectionHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Image.asset('assets/payment/Icon awesome-check-circle.png'),
        ),
        SizedBox(height: 10.h),
        Text(
          "Booking Successful",
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5.h),
        Text(
          "Thank you for Choosing Touf w shof",
          style: TextStyles.font16grey400Regular,
        ),
      ],
    );
  }
}
