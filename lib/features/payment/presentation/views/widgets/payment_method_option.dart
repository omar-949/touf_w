import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodOption extends StatelessWidget {
  final String assetPath;
  //final String method;
  final bool isSelected;

  const PaymentMethodOption({
    super.key,
    required this.assetPath,
    //required this.method,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: isSelected ? Colors.orange : Colors.transparent,
          width: isSelected ? 2.w : 0, //
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Image.asset(
        assetPath,
        width: 80.w, // Adjust size as needed
        height: 50.h,
      ),
    );
  }
}
