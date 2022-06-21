import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/dummy/recommended_places_dummy.dart';
import 'package:travelmate/features/home_page/controllers/home_controller.dart';
import 'package:travelmate/features/onboarding/pages/onboarding_page.dart';

import '../../../../components/components.dart';
import '../../../../utils/utils.dart';
import '../widgets/widgets.dart';

class RecommendedPlaceView extends StatelessWidget {
  RecommendedPlaceView({
    Key? key,
  }) : super(key: key);

  final listRecommended = RecommendedPlacesDummy.list();

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 26.w),
          child: const Text(
            'Recommended Places',
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 21.w),
        Obx(() {
          if (homeController.isInterestsEmpty.value) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'You have not select your interests.',
                    style: TextStyles.heading5Regular(),
                  ),
                  SizedBox(height: 48.w),
                  CustomButton.info(
                    text: 'Select interests',
                    onTap: () => Get.toNamed(onboardingPageRoute),
                    margin: EdgeInsets.symmetric(horizontal: 64.w),
                  ),
                ],
              ),
            );
          }
          if (homeController.isLoading.value) {
            return ShimmerContainer(
              width: 1.sw,
              margin: EdgeInsets.symmetric(horizontal: 24.w),
              height: 100.w,
              radius: 15.r,
            );
          } else {
            if (homeController.recommendedDestinations.isNotEmpty) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                clipBehavior: Clip.none,
                itemCount: homeController.recommendedDestinations.length,
                separatorBuilder: (_, __) {
                  return SizedBox(height: 15.w);
                },
                itemBuilder: (context, index) {
                  return RecommendedPlaceCard(
                    destination: homeController.recommendedDestinations[index],
                  );
                },
              );
            } else {
              return Center(
                child: Text(
                  'There is no available invitation',
                  style: TextStyles.heading5Regular(),
                ),
              );
            }
          }
        }),
      ],
    );
  }
}
