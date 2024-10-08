import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/search_widget.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/tab_bar_widget.dart';

import '../../../../../core/resources/assets.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 295.h,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.mainImage,
                  ),
                  fit: BoxFit.fill,
                  colorFilter: ColorFilter.mode(
                      TextColors.darkGrey.withOpacity(.50), BlendMode.hardLight),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildSearchRow(),
              ],
            ),

          ),
          Padding(
            padding: EdgeInsets.only(top: 200.h),
              child: CustomTabWidget()),
        ],
      ),
    );
  }

  Widget _buildSearchRow() {
    return Row(
      children: [
        SearchWidget(),
        Image.asset(
          Assets.filterImage,
          height: 24.h,
          width: 24.w,
          fit: BoxFit.fill,
        )
      ],
    );
  }
}
