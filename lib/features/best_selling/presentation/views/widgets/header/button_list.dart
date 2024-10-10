import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'button_row.dart';


class ButtonList extends StatelessWidget {
  const ButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildLabelButton(label: 'Add to Wishlist', imagePath: 'assets/best_selling/whishlest.png'),
            SizedBox(width: 60.w),
            _buildLabelButton(label: 'Map', imagePath: 'assets/best_selling/map.png'),
          ],
        ),
        SizedBox(height: 5.h),
        _buildLabelButton(label: 'Watch Video', imagePath: 'assets/best_selling/watch.png'),
      ],
    );
  }

  Widget _buildLabelButton({required String label, required String imagePath}) {
    return ButtonRow(
      label: label,
      imagePath: imagePath,
      onPressed: () {
      },
    );
  }
}
