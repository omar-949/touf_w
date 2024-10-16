import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/features/home/presentation/views/widgets/outings/active_programs.dart';

class OutingsTab extends StatelessWidget {
  const OutingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          ActivePrograms(),
      ],
    );
  }
}
