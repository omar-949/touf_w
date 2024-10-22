import 'package:flutter/material.dart';
import 'package:toufwshouf/features/payment/data/models/program_group_model/program_group_model.dart';
import 'package:toufwshouf/features/payment/presentation/views/widgets/passenger_data_widgets/number_selector_widget.dart';
class BuildCountSelector extends StatefulWidget {
  const BuildCountSelector({
    super.key,
    required this.person,
    required this.maxAval,
    required this.onUpdate,
  });

  final ProgramGroupModel person;
  final int maxAval;
  final VoidCallback onUpdate;

  @override
  State<BuildCountSelector> createState() => _BuildCountSelectorState();
}

class _BuildCountSelectorState extends State<BuildCountSelector> {
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
    return NumberSelectorWidget(
      label: widget.person.paxType ?? "",
      price: widget.person.pPrice?.toString() ?? 0.toString(),
      count: widget.person.count,
      onAdd: () {
        if (total < widget.maxAval) {
          _incrementCount(widget.person);
          total++;
          print("Total after increment: $total");
        }
      },
      onRemove: () {
        if (total > 0) {
          _decrementCount(widget.person);
          total--;
          print("Total after decrement: $total");
        }
      },
    );
  }
}

