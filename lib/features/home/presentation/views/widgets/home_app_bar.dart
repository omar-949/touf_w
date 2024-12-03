import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/assets.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      scrolledUnderElevation: 0,
      leadingWidth: 160.w,
      leading: Image.asset(
        Assets.logo,
      ),
      actions: [
        IconButton(
          icon: Image.asset(
            Assets.appBarAction1,
            height: 24.h,
            width: 24.w,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset(
            Assets.appBarAction2,
            height: 24.h,
            width: 24.w,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset(
            Assets.appBarAction3,
            height: 24.h,
            width: 24.w,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
