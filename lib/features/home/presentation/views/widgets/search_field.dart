import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/resources/colors.dart';
import '../../../../../../core/resources/styles.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 25.h),
      child: SizedBox(
        height: 36.h,
        child: TextField(
          controller: controller,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: 'Search for...',
            contentPadding: EdgeInsets.only(top: 5.h),
            prefixIcon:
                Icon(Icons.search, color: TextColors.mediumGrey, size: 24.sp),
            hintStyle: TextStyles.font16MediumGreyRegular,
            filled: true,
            fillColor: TextColors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0.r),
              borderSide: const BorderSide(
                color: TextColors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: TextColors.white,
              ),
              borderRadius: BorderRadius.circular(8.0.r),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: TextColors.white,
              ),
              borderRadius: BorderRadius.circular(8.0.r),
            ),
          ),
        ),
      ),
    );
  }
}
