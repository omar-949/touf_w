import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:toufwshouf/core/resources/styles.dart'; // Assuming you have a Styles class defined here.

class ExpandableSection extends StatelessWidget {
  final String title;
  final String content;
  final bool isExpanded;
  final VoidCallback onTap;

  const ExpandableSection({
    Key? key,
    required this.title,
    required this.content,
    required this.isExpanded,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 358.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: Offset(1, 2),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Column(
          children: [
            // Title and icon
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyles.font20BlackMedium,
                  ),
                  Icon(
                    isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            // Expandable content
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: isExpanded ? null : 0, // Set height to 0 when collapsed
              padding:
                  isExpanded ? const EdgeInsets.all(10.0) : EdgeInsets.zero,
              child: isExpanded
                  ? Text(
                      content,
                      style: TextStyles.font16BlackRegular,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
