import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/widgets/custom_container_details.dart';
import 'package:toufwshouf/core/widgets/reusable_vertical_list_screen.dart';

class BestSellingBody extends StatelessWidget {
  const BestSellingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<CustomContainerDetails> items = List.generate(
      15,
          (index) => CustomContainerDetails(
        image: 'assets/best_selling/Mask Group 4 1.png',
        tripName: 'The Egyptian Gulf (Hospice of the Sultan)',
        rating: 4.5,
        containerText1: 'Start From',
        containerSalary1: '850 EGP',
        height: 109.h,
        width: 181.w,
        isNotNeed: true,
      ),
    );

    return ReusableListScreen(
      title: "Best Selling",
      items: items,
    );
  }
}
