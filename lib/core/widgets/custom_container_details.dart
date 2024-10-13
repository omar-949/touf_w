import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/widgets/rating_widget.dart';

import '../resources/colors.dart';
import '../resources/styles.dart';
import '../routing/routes.dart';
import 'container_salary_widget.dart';

class CustomContainerDetails extends StatefulWidget {
  const CustomContainerDetails({
    super.key,
    required this.image,
    this.tripName,
    required this.rating,
    required this.containerText1,
    required this.containerSalary1,
    this.isDashed1,
    this.isNotNeed,
    this.height,
    this.width,
  });

  final String image;
  final String? tripName;
  final String containerText1;
  final String containerSalary1;
  final bool? isDashed1;
  final double rating;
  final bool? isNotNeed;
  final double? height;
  final double? width;

  @override
  State<CustomContainerDetails> createState() => _CustomContainerDetailsState();
}

class _CustomContainerDetailsState extends State<CustomContainerDetails> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.detailScreen);
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 10.h,
          left: widget.isNotNeed == null ? 15.w : 0,
        ),
        height: widget.height ?? 215.h,
        width: widget.width ?? 265.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          image: DecorationImage(
            image: AssetImage(widget.image),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ContainerSalaryWidget(
                  containerText: widget.containerText1,
                  containerSalary: widget.containerSalary1,
                  isDashed: widget.isDashed1,
                  isBig: widget.isNotNeed == null,
                ),
                widget.isNotNeed != null
                    ? Padding(
                        padding: EdgeInsets.only(right: 15.w, top: 15.h),
                        child: Container(
                          height: 38.h,
                          width: 38.w,
                          decoration: const BoxDecoration(
                            color: AppColors.background,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.favorite,
                            color: AppColors.orange,
                            size: 18.sp,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
            widget.isNotNeed == null
                ? Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 5.w, bottom: 10.h, right: 5.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.tripName ?? '',
                            style: TextStyles.font18WhiteMedium,
                          ),
                          SizedBox(height: 8.h),
                          CustomRatingWidget(rating: widget.rating),
                        ],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
