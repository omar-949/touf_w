import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:toufwshouf/core/resources/colors.dart';
import 'package:toufwshouf/core/resources/styles.dart';

class CustomTab extends StatelessWidget {
  final String iconPath;
  final String text;
  final bool isActive;

  const CustomTab({
    super.key,
    required this.iconPath,
    required this.text,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          iconPath,
          colorFilter: isActive
              ? const ColorFilter.mode(AppColors.orange, BlendMode.srcIn)
              : const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
        6.horizontalSpace,
        Text(
          text,
          style: isActive ? TextStyles.font18OrangeRegular : TextStyles.font18WhiteRegular,
        ),
      ],
    );
  }
}
