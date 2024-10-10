import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodOption extends StatelessWidget {
  final String assetPath;
  final String method;
  final String? selectedMethod;
  final VoidCallback onSelected;

  const PaymentMethodOption({
    super.key,
    required this.assetPath,
    required this.method,
    required this.selectedMethod,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.white,
          border: selectedMethod == method
              ? Border.all(color: Colors.orange, width: 2)
              : null,
        ),
        width: 107.w,
        height: 53.h,
        child: Center(child: Image.asset(assetPath)),
      ),
    );
  }
}
