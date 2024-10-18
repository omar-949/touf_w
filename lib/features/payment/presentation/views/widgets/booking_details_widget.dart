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
  void _incrementCount(Person person) {
    setState(() {
      person.count++;
    });
  }

  void _decrementCount(Person person) {
    setState(() {
      if (person.count > 0) {
        person.count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildPaymentMethod(),
      ],
    );
  }

  Widget _buildPaymentMethod() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfffffbfb),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: TextStyles.font18darkGreyMedium),
            const SizedBox(height: 16),
            ...widget.people.map((person) => Padding(
                  padding: EdgeInsets.only(bottom: 16.0.h),
                  child: _buildCountSelector(
                    person,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildCountSelector(Person person) {
    return CountSelector(
      label: person.label,
      price: person.price,
      count: person.count,
      onAdd: () => _incrementCount(person),
      onRemove: () => _decrementCount(person),
    );
  }
}
