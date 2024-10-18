import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/widgets/app_horizontal_list_view_item.dart';

class StackImagePayment extends StatelessWidget {
  const StackImagePayment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.red,
        image: DecorationImage(
          image: AssetImage('assets/home/bestselling1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          ItemDetails(
            title: 'The Egyptian Gulf (Hospice of the Sultan)',
            rating: 3.2,
          ),
        ],
      ),
    );
  }
}
