import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/utils/utils.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({Key? key, this.isOpen = false}) : super(key: key);

  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    final Color color = isOpen ? CustomColors.danger : CustomColors.success;
    final String text = isOpen ? 'Open' : 'Closed';
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 7.w,
        vertical: 5.w,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyles.heading7Regular(color: CustomColors.white),
        ),
      ),
    );
  }
}
