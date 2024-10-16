import 'package:flutter/material.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/home_section_header.dart';

class Advertisements extends StatelessWidget {
  const Advertisements({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeSectionHeader(
          section: "Advertisements",
        ),
      ],
    );
  }
}
