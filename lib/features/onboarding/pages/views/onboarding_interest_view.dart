import 'package:flutter/material.dart';
import 'package:travelmate/authentication/authentication_manager.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/onboarding/controllers/onboarding_controller.dart';
import 'package:travelmate/utils/utils.dart';

import '../../../../components/components.dart';
import '../widgets/widgets.dart';

String onboardingInterestPageRoute = 'onboarding-interest';

class OnboardingInterestView extends StatefulWidget {
  const OnboardingInterestView({
    Key? key,
    required this.onContinueCallback,
  }) : super(key: key);

  final VoidCallback onContinueCallback;

  @override
  State<OnboardingInterestView> createState() => _OnboardingInterestViewState();
}

class _OnboardingInterestViewState extends State<OnboardingInterestView> {
  bool ableToContinue = true;

  final OnboardingController onboardingController =
      Get.find<OnboardingController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 100.w),
              Text(
                textAlign: TextAlign.center,
                'What are your\ninterests?',
                style: TextStyles.heading1(),
              ),
            ],
          ),
        ),
        Obx(() {
          if (onboardingController.isLoadLoading.value) {
            ableToContinue = false;
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (onboardingController.interests.isNotEmpty) {
            ableToContinue = true;
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 42.w),
                child: SizedBox(
                  height: 250.w,
                  width: 1.sw,
                  child: SingleChildScrollView(
                    child: Column(
                      children: onboardingController.interests
                          .map(
                            (interest) => InterestOptionWidget(
                              category: interest,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        }),
        Obx(() {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                (onboardingController.selectedInterests.isEmpty)
                    ? CustomButton.inactive(
                        text: 'Continue',
                      )
                    : (!onboardingController.isSubmitLoading.value)
                        ? CustomButton.info(
                            text: 'Continue',
                            onTap: () async {
                              final isSuccess = await onboardingController
                                  .updateInterestToNetwork();
                              if (isSuccess) {
                                Get.find<AuthenticationManager>()
                                    .getMyDetailFromNetworkAndSaveToLocal();
                                widget.onContinueCallback();
                              } else {
                                Get.snackbar('Error', 'Terjadi kesalahan');
                              }
                            },
                          )
                        : CustomButton.inactive(
                            text: '',
                            child: const CircularProgressIndicator(),
                          ),
                SizedBox(height: 100.w),
              ],
            ),
          );
        }),
      ],
    );
  }
}
