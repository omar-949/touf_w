import 'package:flutter/material.dart';
import 'package:toufwshouf/core/helpers/extensions.dart';

import '../../../../../../core/resources/styles.dart';

class SeeAllAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SeeAllAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: Icon(Icons.arrow_back_ios_new_outlined),
      title: Text(
        title,
        style: TextStyles.font16BlackMedium,
      ),
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: Icon(Icons.arrow_back_ios),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
