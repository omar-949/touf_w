import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors.dart';
import '../../../../../core/resources/styles.dart';

class ConfirmationButtons extends StatelessWidget {
  final Function() onConfirmPressed; // Add a function parameter to handle confirmation

  const ConfirmationButtons({Key? key, required this.onConfirmPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column( // Wrap the Row in a Column to allow for spacing
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 171.w,
              height: 44.h,
              child: ElevatedButton(
                onPressed: () {
                  onConfirmPressed(); // Call the function passed from the parent
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: TextColors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.r)),
                  ),
                  elevation: 0,
                ),
                child: Text("Confirm", style: TextStyles.font18WhiteMedium),
              ),
            ),
            SizedBox(
              width: 171.w,
              height: 44.h,
              child: ElevatedButton(
                onPressed: () {
                  // Add action for back button if needed
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.r)),
                    side: BorderSide(color: Colors.orange, width: 1.0),
                  ),
                  elevation: 0,
                ),
                child: Text("Back", style: TextStyles.font18OrangeMedium),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h), // Spacing at the bottom
      ],
    );
  }
}
