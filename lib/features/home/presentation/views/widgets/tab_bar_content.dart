import 'package:flutter/material.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/outings/outings_tab.dart';

class TabBarContent extends StatelessWidget {
  final int index;

  const TabBarContent({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    switch (index) {
      case 0:
        return const OutingsTab();
      case 1:
        return const HotelsTab();
      case 2:
        return const TransportationTab();
      default:
        return Container();
    }
  }
}

class HotelsTab extends StatelessWidget {
  const HotelsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Hotels Tab Content'),
    );
  }
}

class TransportationTab extends StatelessWidget {
  const TransportationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Transportation Tab Content'),
    );
  }
}
