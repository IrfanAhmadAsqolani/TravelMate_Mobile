import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/onboarding/controllers/onboarding_controller.dart';
import 'package:travelmate/models/models.dart';

import '../../../../utils/utils.dart';

class InterestOptionWidget extends StatelessWidget {
  InterestOptionWidget({
    Key? key,
    required this.category,
  }) : super(key: key);

  final CategoryMdl category;

  final OnboardingController onboardingController =
      Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () => onboardingController.selectInterest(category),
        child: Container(
          height: 30.w,
          width: 1.sw,
          margin: EdgeInsets.only(bottom: 14.w),
          decoration: BoxDecoration(
            color: (onboardingController.selectedInterests.contains(category))
                ? CustomColors.success
                : CustomColors.white,
            borderRadius: BorderRadius.circular(30.r),
            boxShadow: Shadows.defaultShadow(),
          ),
          child: Center(
            child: Text(
              category.name ?? '',
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ),
      );
    });
  }
}
