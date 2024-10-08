import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';

import '../../../../../core/resources/styles.dart';

class ContainerSalaryWidget extends StatelessWidget {
  const ContainerSalaryWidget(
      {super.key,
      required this.containerText,
      required this.containerSalary,
      this.isDashed});
  final String containerText;
  final String containerSalary;
  final bool? isDashed;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      width: 89.w,
      padding: EdgeInsets.only(top: 3.h, bottom: 2.h, left: 5.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(12.r)),
          color: AppColors.background),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(containerText,
              style: isDashed == null
                  ? TextStyles.font10MediumGreyRegular
                  : TextStyles.font10MediumGreyRegularWithLineThrough),
          Text(
            containerSalary,
            style: TextStyles.font16OrangeSemiBold,
          )
        ],
      ),
    );
  }
}
