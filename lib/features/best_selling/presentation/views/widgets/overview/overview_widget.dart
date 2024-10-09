import 'package:flutter/material.dart';
import 'overview_text.dart';

class OverviewWidget extends StatefulWidget {
  final String overviewMainText;
  final String additionalInfo;

  const OverviewWidget({
    super.key,
    required this.overviewMainText,
    required this.additionalInfo,
  });

  @override
  State<OverviewWidget> createState() => _OverviewWidgetState();
}

class _OverviewWidgetState extends State<OverviewWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: OverviewText(
        mainText: widget.overviewMainText,
        additionalInfo: widget.additionalInfo,
      ),
    );
  }
}
