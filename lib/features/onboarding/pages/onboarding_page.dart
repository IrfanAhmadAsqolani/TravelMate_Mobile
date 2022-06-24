import 'package:flutter/material.dart';
import 'package:travelmate/authentication/authentication_manager.dart';
import 'package:travelmate/features/main_page/main_page.dart';
import 'package:travelmate/features/onboarding/controllers/onboarding_controller.dart';

import '../../../dependencies/dependencies.dart';
import 'views/views.dart';

const String onboardingPageRoute = '/onboarding-page';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int index = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    Get.put(OnboardingController());

    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          OnboardingInterestView(
            onContinueCallback: () => onboardingNavigation(1),
          ),
          OnboardingUploadKTPView(
            onContinueCallback: () => onboardingNavigation(2),
          ),
          OnboardingCompletedView(
            onContinueCallback: () => onboardingNavigation(),
          ),
        ],
      ),
    );
  }

  Future<void> onboardingNavigation([int? newPage]) async {
    if (newPage == null) {
      Get.offAllNamed(mainPageRoute);
      return;
    }
    final user = await Get.find<AuthenticationManager>().getMyUserData();
    if (newPage == 1) {
      if ((user?.identityPictUrl ?? '-') == '-') {
        controller.jumpToPage(1);
      } else {
        Get.offAllNamed(mainPageRoute);
      }
    } else if (newPage == 2) {
      controller.jumpToPage(2);
    }
  }
}
