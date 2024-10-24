import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import '../resources/styles.dart';

class ContainerSalaryWidget extends StatelessWidget {
  const ContainerSalaryWidget({
    super.key,
    required this.containerText,
    required this.containerSalary,
    this.isDashed,
    this.isBig = true,
  });

  final String containerText;
  final String containerSalary;
  final bool? isDashed;
  final bool isBig;

  @override
  Widget build(BuildContext context) {
    return Container(
      //   height: isBig ? 44.h : 40.h,
      width: isBig ? 89.w : 73.w,
      padding: isBig
          ? EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w)
          : EdgeInsets.symmetric(vertical: 3.h, horizontal: 6.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(12.r)),
        color: AppColors.background,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            containerText,
            style: isDashed == null
                ? TextStyles.font10MediumGreyRegular
                : TextStyles.font10MediumGreyRegularWithLineThrough,
          ),
          SizedBox(
            height: 2.h,
          ),
          Text(
            maxLines: 1,
            containerSalary,
            style: isBig
                ? TextStyles.font16OrangeSemiBold
                : TextStyles.font14OrangeSemiBold,
          ),
        ],
      ),
    );
  }
}
