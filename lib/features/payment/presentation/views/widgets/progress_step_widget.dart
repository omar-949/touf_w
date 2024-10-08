import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressStepWidget extends StatelessWidget {
  final Color firstCircleColor;
  final Color secondCircleColor;
  final Color thirdCircleColor;
  final Color lineColor1;
  final Color lineColor2;

  ProgressStepWidget({
    required this.firstCircleColor,
    required this.secondCircleColor,
    required this.thirdCircleColor,
    required this.lineColor1,
    required this.lineColor2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildCircleWithText('1', firstCircleColor),
              _buildHorizontalLine(lineColor1),
              _buildCircleWithText('2', secondCircleColor),
              _buildHorizontalLine(lineColor2),
              _buildCircleWithText('3', thirdCircleColor),
            ],
          ),
        ),
        _buildStepLabels(),
      ],
    );
  }

  // Widget to build circle with text inside
  Widget _buildCircleWithText(String text, Color color) {
    return Column(
      children: [
        Container(
          width: 24.0.w,
          height: 24.0.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color, // Circle color
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 11.sp, color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ],
    );
  }

  // Widget to build horizontal line
  Widget _buildHorizontalLine(Color color) {
    return Container(
      width: 120.w, // Width of the horizontal line
      height: 2.h, // Height of the horizontal line
      color: color, // Line color
    );
  }

  // Widget to build step labels
  Widget _buildStepLabels() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildStepLabel("Passenger data", 90.w),
        _buildStepLabel("Payment and confirm", 120.w),
        _buildStepLabel("Success", 75.w),
      ],
    );
  }

  // Widget to build individual step label
  Widget _buildStepLabel(String label, double width) {
    return SizedBox(
      width: width,
      height: 60.h,
      child: Center(
        child: Text(
          label,
          style: TextStyle(fontSize: 16.sp, color: Colors.grey[800], fontWeight: FontWeight.w500),
          textAlign: TextAlign.center, // Optional: Center text within the Text widget
        ),
      ),
    );
  }
}
