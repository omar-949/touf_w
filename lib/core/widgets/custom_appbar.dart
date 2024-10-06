import 'package:flutter/material.dart';

import '../resources/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String route;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: InkWell(
        onTap: () {
          //
        },
        child: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black, size: 18,),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyles.customTextStyle
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
