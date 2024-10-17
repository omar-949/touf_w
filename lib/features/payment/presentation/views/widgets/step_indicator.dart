import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class StepIndicator extends StatelessWidget {
  final int currentStep;

  const StepIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 36.w),
          child: Row(
            children: [
              _buildCircleWithText(1),
              _buildHorizontalLine(1),
              _buildCircleWithText(2),
              _buildHorizontalLine(2),
              _buildCircleWithText(3),
            ],
          ),
        ),
        _buildStepLabels(),
      ],
    );
  }

  Widget _buildCircleWithText(int step) {
    Color circleColor = _getCircleColor(step);
    return Column(
      children: [
        Container(
          width: 35.w,
          height: 35.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: circleColor,
          ),
          child: Center(
            child: Text(
              '$step',
              style: TextStyle(
                  fontSize: 11.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500), // زيادة حجم النص
            ),
          ),
        ),
      ],
    );
  }

  // Widget to build horizontal line
  Widget _buildHorizontalLine(int step) {
    Color lineColor = _getLineColor(step);
    return Expanded(
      child: Container(
        height: 4.h,
        color: lineColor,
      ),
    );
  }

  Color _getCircleColor(int step) {
    if (currentStep == 1) {
      return step == 1 ? Colors.orange : Colors.grey;
    } else if (currentStep == 2) {
      return step <= 2 ? Colors.orange : Colors.grey;
    } else {
      return Colors.orange;
    }
  }

  Color _getLineColor(int step) {
    return currentStep >= step + 1 ? Colors.orange : Colors.grey;
  }

  Widget _buildStepLabels() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStepLabel("Passenger data"),
        _buildStepLabel("Payment and confirm"),
        _buildStepLabel("Success"),
      ],
    );
  }

  Widget _buildStepLabel(String label) {
    return SizedBox(
      width: 120.w,
      height: 48.h,
      child: Center(
        child: Text(
          label,
          style: TextStyles.font16BlackMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
