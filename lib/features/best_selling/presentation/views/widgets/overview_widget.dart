import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart'; // Assuming you have a Styles class defined here.

class OverviewWidget extends StatefulWidget {
  final String overviewMainText;
  final String additionalInfo;

  const OverviewWidget({super.key, required this.overviewMainText, required this.additionalInfo});

  @override
  State<OverviewWidget> createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trip Overview Section
            Text(
              widget.overviewMainText, // Accessing the property correctly
              style: TextStyles.font16DarkGreyRegular,
            ),
            SizedBox(height: 10.h),

            // Additional Info Section
            Text(
              'Additional Info',
              style: TextStyles.font18MediumDarkGreyMedium,
            ),
            SizedBox(height: 10.h),
            Text(
              widget.additionalInfo, // Accessing the property correctly
              style: TextStyles.font16DarkGreyRegular,
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
