import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/payment/data/models/program_group_model/program_group_model.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/custom_selector.dart';
import '../../../../../core/resources/styles.dart';

class NumberOfPeopleWidget extends StatefulWidget {
  final String title;
  final List<ProgramGroupModel> people;
  final int count;
  final VoidCallback onUpdate;

  const NumberOfPeopleWidget({
    super.key,
    required this.title,
    required this.people,
    required this.count, required this.onUpdate,
  });

  @override
  State<NumberOfPeopleWidget> createState() => _NumberOfPeopleWidgetState();
}

class _NumberOfPeopleWidgetState extends State<NumberOfPeopleWidget> {
  late List<ProgramGroupModel> persons;


  @override
  void initState() {
    super.initState();
    persons = widget.people;
  }

  void _incrementCount(ProgramGroupModel person) {
    setState(() {
      person.incrementCount();
      widget.onUpdate();
    });
  }

  void _decrementCount( ProgramGroupModel person) {
    setState(() {
      person.decrementCount();
      widget.onUpdate();
    });
  }
  Widget build(BuildContext context) {
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
            Row(
              children: [
                Text(widget.title, style: TextStyles.font18darkGreyMedium),
                SizedBox(width: 8.w),
                Text('${widget.count}', // Display the total number of people
                    style: TextStyles.font22darkGreyMedium
                        .copyWith(color: Colors.blue)),
              ],
            ),
            const SizedBox(height: 16),
            ...widget.people.map((person) => Padding(
              padding: EdgeInsets.only(bottom: 16.0.h),
              child: _buildCountSelector(person),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildCountSelector(ProgramGroupModel person) {
    return CountSelectorNumber(
      label: person.paxType??"",
      price: person.pPrice?.toString()?? 0 .toString(),
      count: person.count,
      onAdd: () {
        _incrementCount(person); // استخدم الدالة للتحديث
      },
      onRemove: () {
        _decrementCount(person); // استخدم الدالة للتحديث
      },
    );
  }
}
