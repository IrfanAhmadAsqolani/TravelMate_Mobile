import 'package:flutter/material.dart';
import 'package:travelmate/features/home_page/pages/home_page.dart';

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
    return Scaffold(
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          OnboardingInterestView(
            onContinueCallback: () => controller.jumpToPage(1),
          ),
          OnboardingUploadKTPView(
            onContinueCallback: () => controller.jumpToPage(2),
          ),
          OnboardingCompletedView(
            onContinueCallback: () => Get.offAllNamed(homePageRoute),
          ),
        ],
      ),
    );
  }
}
