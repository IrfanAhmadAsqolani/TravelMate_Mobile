import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/utils/utils.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.w,
        vertical: 5.w,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Text(
        title,
        style: TextStyles.heading7Regular(),
      ),
    );
  }
}
