import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/booking_details_widget.dart';

import '../../../../../core/resources/styles.dart';
import '../../../data/models/person_model.dart';
class BookingSection extends StatelessWidget {
  const BookingSection({super.key});
final double total = 2555;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          BookingDetailsWidget(title: "Number of people", people: people),
          BookingDetailsWidget(title: "Additional Services", people: additionalService),
          SizedBox(height: 24.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total", style: TextStyles.font24darkGreymedium),
              Text("${total.toStringAsFixed(2)} EGP",
                  style: TextStyles.font24darkGreymedium),
            ],
          ),

        ],
      ),
    );
  }
}
