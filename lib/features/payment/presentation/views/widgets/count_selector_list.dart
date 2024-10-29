import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/passenger_data_widgets/number_selector_widget.dart';

import '../../../data/models/program_group_model/program_group_model.dart';

class CountSelectorList extends StatefulWidget {
  final List<ProgramGroupModel> people;
  final int count;
  final VoidCallback onUpdate;

  const CountSelectorList({super.key,
    required this.people,
    required this.count,
    required this.onUpdate,
  });

  @override
  State<CountSelectorList> createState() => _CountSelectorListState();
}

class _CountSelectorListState extends State<CountSelectorList> {
  int total = 0;

  void _incrementCount(ProgramGroupModel person) {
    setState(() {
      person.incrementCount();
      widget.onUpdate();
    });
  }

  void _decrementCount(ProgramGroupModel person) {
    setState(() {
      person.decrementCount();
      widget.onUpdate();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.people.map((person) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.0.h, left: 10.w, right: 10.w),
          child: NumberSelectorWidget(
            label: person.paxType ?? "",
            price: person.pPrice?.toString() ?? 0.toString(),
            count: person.count,
            onAdd: () {
              if (total < widget.count) {
                _incrementCount(person);
                total++;
                print("Total after increment: $total");
              }
            },
            onRemove: () {
              if (total > 0) {
                _decrementCount(person);
                total--;
                print("Total after decrement: $total");
              }
            },
          ),
        );
      }).toList(),
    );
  }
}
