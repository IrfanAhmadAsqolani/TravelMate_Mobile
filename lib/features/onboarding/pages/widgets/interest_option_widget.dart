import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';

import '../../../../utils/utils.dart';

class InterestOptionWidget extends StatelessWidget {
  const InterestOptionWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.isActive = false,
  }) : super(key: key);

  final String title;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30.w,
        width: 1.sw,
        margin: EdgeInsets.only(bottom: 14.w),
        decoration: BoxDecoration(
          color: (isActive) ? CustomColors.success : CustomColors.white,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: Shadows.defaultShadow(),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      ),
    );
  }
}
