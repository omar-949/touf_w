import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/core/widgets/rating.dart';

class AppHorizontalListViewItem extends StatelessWidget {
  const AppHorizontalListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.0.w),
      child: Container(
        height: 216.h,
        width: 265.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Colors.red,
          image: const DecorationImage(
            // Todo: Replace with CachedNetworkImageProvider if needed
            image: AssetImage('assets/home/bestselling1.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PriceTag(
              price: '850',
            ),
            const Spacer(),
            const ItemDetails(
              title: 'The Egyptian Gulf (Hospice of the Sultan)',
              rating: 3.2,
            ),
          ],
        ),
      ),
    );
  }
}

class PriceTag extends StatelessWidget {
  final String? oldPrice;
  final String price;

  const PriceTag({
    super.key,
    required this.price,
    this.oldPrice,
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
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            oldPrice != null ? '$oldPrice Egp' : 'Start From',
            style: oldPrice != null
                ? TextStyles.font10MediumGreyRegularWithLineThrough
                : TextStyles.font10MediumGreyRegular,
          ),
          3.verticalSpace,
          Text(
            '$price EGP',
            style: TextStyles.font16OrangeSemiBold,
          ),
        ],
      ),
    );
  }
}

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.title, required this.rating});

  final String title;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.font18WhiteMedium,
          ),
          6.verticalSpace,
          CustomStarRating(
            rating: rating,
          ),
        ],
      ),
    );
  }
}
