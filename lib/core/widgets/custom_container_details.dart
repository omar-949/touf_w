import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/widgets/rating_widget.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/container_salary_widget.dart';

import '../routing/routes.dart';

class CustomContainerDetails extends StatefulWidget {
  CustomContainerDetails(
      {super.key,
      required this.image,
      this.tripName,
      required this.rating,
      required this.containerText1,
      required this.containerSalary1,
      this.isDashed1,
      this.isNotNeed,
      this.height,
      this.width});
  final String image;
  final String? tripName;
  final String containerText1;
  final String containerSalary1;
  final bool? isDashed1;
  late final double rating;
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
      onTap: (){
        context.pushNamed(Routes.datailScreen);
      },
      child: Container(
        margin: EdgeInsets.only( bottom: 10.h, left: widget.isNotNeed == null ? 15.w :0),
        height: widget.height ?? 215.h,
        width: widget.width ?? 265.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            image: DecorationImage(
                image: AssetImage(widget.image), fit: BoxFit.fill)),
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
                ),
                widget.isNotNeed == null
                ? Padding(
                        padding: EdgeInsets.only(right: 15.w, top: 15.h),
                        child: Container(
                          height: 38.h,
                          width: 38.w,
                          decoration: BoxDecoration(
                              color: AppColors.background,
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.favorite,
                            color: AppColors.orange,
                            size: 18.sp,
                          ),
                        ),
                      ) : SizedBox.shrink()
              ],
            ),
            widget.isNotNeed == null
                ? Padding(
                    padding: EdgeInsets.only(left: 5.w, bottom: 10.h, right: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: 255.w,
                                child: Text(
                                  widget.tripName!,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.font18WhiteMedium,
                                )),
                            SizedBox(
                              height: 8.h,
                            ),
                            CustomRatingWidget(rating: widget.rating )
                          ],
                        )
                      ],
                    ),
                  )
                : SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
