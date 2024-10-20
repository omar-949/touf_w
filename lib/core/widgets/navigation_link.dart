import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class NavigationLink extends StatelessWidget {
  final String questionText;
  final String actionText;
  final VoidCallback onPressed;

  const NavigationLink({
    super.key,
    required this.questionText,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              questionText,
              style: TextStyles.font13GreyMedium
                  .copyWith(fontFamily: 'Montserrat'),
            ),
            SizedBox(width: 4.w),
            Text(
              actionText,
              style:
                  TextStyles.font13BlueBold.copyWith(fontFamily: 'Montserrat'),
            ),
          ],
        ),
      ),
    );
  }
}
