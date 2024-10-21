import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';
import 'package:toufwshouf/core/helpers/shared_pref_helper.dart';
import 'package:toufwshouf/core/helpers/shared_pref_keys.dart';
import 'package:toufwshouf/core/resources/assets.dart';
import 'package:toufwshouf/main.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/custom_button.dart';

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
          onPressed: () {
            isLoggedUser
                ? context.showCustomDialog(title: Text("error"),
              content: Text("You already logged in"),
              confirmButton: CustomButton(text: "Log Out", onPressed: () {
                SharedPrefHelper.removeData(key: SharedPrefKeys.accessToken);
                isLoggedUser = false;
                context.pop();
              }),
              cancelButton: CustomButton(text: "cancel", onPressed: () {
                context.pop();
              }),)
                : context.pushNamed(Routes.loginView);
          },
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
