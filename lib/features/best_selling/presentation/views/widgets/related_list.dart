import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class RelatedListWidget extends StatelessWidget {
  final List<Widget> relatedList;

  const RelatedListWidget({super.key, required this.relatedList});

  Widget _buildTextHeader({required String textHeader}) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0.w, bottom: 15.w, top: 10.h),
      child: Row(
        children: [
          Container(
            width: 5.w,
            height: 26.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              color: AppColors.orange,
            ),
          ),
          SizedBox(width: 8.w),
          Text(textHeader, style: TextStyles.font20BlackMedium),
        ],
      ),
    );
  }

  Widget _buildRelatedListHeader() {
    return Padding(
      padding: EdgeInsets.only(right: 20.0.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTextHeader(textHeader: "Related List"),
          Text(
            "See all",
            style: TextStyles.font16BlackRegular,
          ),
        ],
      ),
    );
  }

  Widget _buildRelatedListView() {
    return SizedBox(
      height: 215.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return relatedList[index];
        },
        itemCount: relatedList.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRelatedListHeader(),
        _buildRelatedListView(),
      ],
    );
  }
}
