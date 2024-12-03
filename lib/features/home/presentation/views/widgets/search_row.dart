import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/assets.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/search_field.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SearchField()),
        Image.asset(
          Assets.filter,
          height: 24.h,
          width: 24.w,
        ),
        10.horizontalSpace,
      ],
    );
  }
}
