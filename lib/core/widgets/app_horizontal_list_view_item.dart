import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/widgets/rating.dart';
import 'package:toufwshouf/features/home/data/models/active_program_model/active_program_model.dart';

class AppHorizontalListViewItem extends StatelessWidget {
  const AppHorizontalListViewItem(
      {super.key, this.onTap, required this.activeProgramModel});

  final void Function()? onTap;
  final ActiveProgramModel activeProgramModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0.w),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          height: 216.h,
          width: 265.w,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: CachedNetworkImage(
                  imageUrl: activeProgramModel.imgPath!,
                  fit: BoxFit.cover,
                  height: 216.h,
                  width: 265.w,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: AppColors.grey500,
                    child: const Icon(Icons.error),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PriceTag(
                    price: activeProgramModel.startprice ?? 0,
                  ),
                  const Spacer(),
                  ItemDetails(
                    title: activeProgramModel.programname ?? 'No Title',
                    rating: activeProgramModel.rateReview == "No Review"
                        ? 0.0
                        : double.parse(activeProgramModel.rateReview ?? '0.0'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PriceTag extends StatelessWidget {
  final String? oldPrice;
  final int price;
  final TextStyle? textStyle;

  const PriceTag({
    super.key,
    required this.price,
    this.oldPrice,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(12.w),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            oldPrice != null ? '$oldPrice Egp' : 'Start From',
            style: oldPrice != null
                ? TextStyles.font10MediumGreyRegularWithLineThrough
                : TextStyles.font10MediumGreyRegular,
          ),
          4.verticalSpace,
          Text(
            '$price EGP',
            style: textStyle ?? TextStyles.font16OrangeSemiBold,
          ),
        ],
      ),
    );
  }
}

class ItemDetails extends StatelessWidget {
  const ItemDetails(
      {super.key,
        required this.title,
        required this.rating,
        this.textStyle,
        this.isSpacer = false,
        this.verticalSpace,
        this.horizontalSpace});

  final String title;
  final double rating;
  final TextStyle? textStyle;
  final bool? isSpacer;
  final double? verticalSpace;
  final double? horizontalSpace;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalSpace ?? 16.w, vertical: verticalSpace ?? 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: textStyle ?? TextStyles.font18WhiteMedium,
          ),
          (isSpacer == true) ? const Spacer() : 6.verticalSpace,
          CustomStarRating(
            rating: rating,
          ),
        ],
      ),
    );
  }
}
