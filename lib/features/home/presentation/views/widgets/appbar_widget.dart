import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/assets.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      scrolledUnderElevation: 0,
      leading: Transform.scale(
        scale: 2.5,
        child: Padding(
          padding: EdgeInsets.only(left: 25.w),
          child: Image.asset(
            Assets.splashLogoImage,
            fit: BoxFit.contain,
            width: 100.w,
            height: 50.h,
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            Assets.appbarAction1,
            height: 20.h,
            width: 18.w,
          ),
          visualDensity: VisualDensity(horizontal: -3.0.w),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            Assets.appbarAction2,
            height: 20.h,
            width: 18.w,
          ),
          visualDensity: VisualDensity(horizontal: -2.w),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            Assets.appbarAction3,
            height: 20.h,
            width: 18.w,
          ),
          padding: EdgeInsets.only(right: 20.w),
        ),
      ],
    );
  }
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
