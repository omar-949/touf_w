import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/routing/app_router.dart';

import '../../../../../../core/resources/assets.dart';
import '../../../../../../core/routing/routes.dart';

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
          //visualDensity: VisualDensity(horizontal: -3.0.w),
        ),
        IconButton(
          onPressed: () {
            context.pushNamed(Routes.loginScreen);
          },
          icon: Image.asset(
            Assets.appbarAction2,
            height: 20.h,
            width: 18.w,
          ),
          //visualDensity: VisualDensity(horizontal: -2.w),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              Assets.appbarAction3,
              height: 20.h,
              width: 18.w,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
