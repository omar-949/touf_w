import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/confirm_booking_widgets/payment_method_option_widget.dart';

class PaymentMethodOptionSection extends StatefulWidget {
  const PaymentMethodOptionSection({super.key});

  @override
  State<PaymentMethodOptionSection> createState() =>
      _PaymentMethodOptionSectionState();
}

class _PaymentMethodOptionSectionState
    extends State<PaymentMethodOptionSection> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildPaymentOption(0, 'assets/payment/visa.png'),
        SizedBox(width: 10.w),
        _buildPaymentOption(
          1,
          'assets/payment/mastercard.png',
        ),
        SizedBox(width: 10.w),
        _buildPaymentOption(
          2,
          'assets/payment/paypal.png',
        ),
      ],
    );
  }

  Widget _buildPaymentOption(int index, String assetPath) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: PaymentMethodOptionWidget(
        assetPath: assetPath,
        // method: method,
        isSelected: isSelected,
      ),
    );
  }
}
