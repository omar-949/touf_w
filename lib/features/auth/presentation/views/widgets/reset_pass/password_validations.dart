import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:toufwshouf/core/resources/colors.dart';

import '../../../../../../core/resources/styles.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations(
      {super.key,
      required this.minLength,
      required this.hasNumber,
      required this.hasUppercase,
      required this.hasLowercase});

  final bool minLength;
  final bool hasNumber;
  final bool hasUppercase;
  final bool hasLowercase;

  @override
  Widget build(BuildContext context) {
    int criteriaMet = (minLength ? 1 : 0) +
        (hasNumber ? 1 : 0) +
        (hasUppercase && hasLowercase ? 1 : 0);

    const int totalCriteria = 3;

    double percent = criteriaMet / totalCriteria;
    Color progressColor = dynamicProgressColor(percent);
    return Column(
      children: [
        LinearPercentIndicator(
          backgroundColor: AppColors.grey200,
          barRadius: Radius.circular(12.w),
          progressColor: progressColor,
          percent: percent,
          animation: true,
          animateFromLastPercent: true,
        ),
        5.verticalSpace,
        buildValidationRow(
          "At least 8 characters",
          minLength,
        ),
        2.verticalSpace,
        buildValidationRow(
          "Least one number (0-9) or symbol",
          hasNumber,
        ),
        2.verticalSpace,
        buildValidationRow(
          "Lowercase (a-z) and uppercase (A-Z)",
          hasUppercase && hasLowercase,
        ),
      ],
    );
  }

  buildValidationRow(String text, bool hasValidate) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          hasValidate
              ? Icon(
                  Icons.check,
                  color: Colors.green,
                )
              : Padding(
                  padding: EdgeInsets.only(left: 7.w),
                  child: CircleAvatar(
                    radius: 3,
                    backgroundColor: AppColors.grey500,
                  ),
                ),
          5.horizontalSpace,
          Text(
            text,
            style: hasValidate
                ? TextStyles.font14Green500Medium
                : TextStyles.font14Grey500Medium,
          )
        ],
      ),
    );
  }

  Color dynamicProgressColor(double percent) {
    Color progressColor;

    if (percent == 1 / 3) {
      return progressColor = Colors.red;
    } else if (percent == 2 / 3) {
      return progressColor = AppColors.yellow500;
    } else if (percent == 1) {
      return progressColor = Colors.green;
    } else {
      return progressColor = AppColors.grey200;
    }
  }
}
