import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart';
import 'package:toufwshouf/features/payment/data/models/person_model.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/custom_selector.dart';

class BookingDetailsWidget extends StatefulWidget {
  final String title;
  final List<Person> people;

  const BookingDetailsWidget({
    super.key,
    required this.title,
    required this.people,
  });

  @override
  State<BookingDetailsWidget> createState() => _BookingDetailsWidgetState();
}

class _BookingDetailsWidgetState extends State<BookingDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _buildPaymentMethod(),
        ),
      ],
    );
  }

  Widget _buildPaymentMethod() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xfffffbfb),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Text(widget.title, style: TextStyles.font18darkGreyMedium),
            SizedBox(height: 16),
            ...widget.people.map((person) => _buildCountSelector(person)),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildCountSelector(Person person) {
    return ValueListenableBuilder<int>(
      valueListenable: person.countNotifier,
      builder: (context, count, _) {
        return CountSelector(
          label: person.label,
          price: person.price,
          count: count,
          onAdd: () => person.countNotifier.value++,
          onRemove: () {
            if (count > 0) person.countNotifier.value--;
          },
        );
      },
    );
  }
}
