import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/resources/styles.dart';
class PaymentMethodWidget extends StatelessWidget {
  const PaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10.h),
        Text("Choose payment method", style: TextStyles.font18darkGreyMedium),
        SizedBox(height: 10.h),
        PaymentMethodOption(),
        SizedBox(height: 20.h),
       // const CardDetailsSection(),
        SizedBox(height: 20.h),
      ],
    );
  }
}
class PaymentMethodOption extends StatefulWidget {
  const PaymentMethodOption({super.key});

  @override
  State<PaymentMethodOption> createState() => _PaymentMethodOptionState();
}

class _PaymentMethodOptionState extends State<PaymentMethodOption> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PaymentMethodOption2(
            assetPath: 'assets/payment/visa.png',
            method: 'visa',
          //  selectedMethod: _selectedPaymentMethod,
            onSelected: () {
              setState(() {
              //  _selectedPaymentMethod = 'visa';
              });
            }, selectedMethod: '',),
        SizedBox(width: 10.w), // Space between payment methods
        PaymentMethodOption2(
            assetPath: 'assets/payment/mastercard.png',
            method: 'mastercard',
          //  selectedMethod: _selectedPaymentMethod,
            onSelected: () {
              setState(() {
             //   _selectedPaymentMethod = 'mastercard';
              });
            }, selectedMethod: '',),
        SizedBox(width: 10.w), // Space between payment methods
        PaymentMethodOption2(
            assetPath: 'assets/payment/paypal.png',
            method: 'paypal',
          //  selectedMethod: _selectedPaymentMethod,
            onSelected: () {
              setState(() {
               // _selectedPaymentMethod = 'paypal';
              });
            }, selectedMethod: '',),
      ],
    );
  }
}


class PaymentMethodOption2 extends StatelessWidget {
  final String assetPath;
  final String method;
  final String? selectedMethod;
  final VoidCallback onSelected;

  const PaymentMethodOption2({
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


