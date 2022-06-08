// ignore_for_file: prefer_const_constructors

import 'package:travelmate/features/home_page/pages/home_page.dart';
import 'package:travelmate/features/onboarding/pages/onboarding_page.dart';

import '../../dependencies/dependencies.dart';
import '../../features/destination_detail/pages/destination_detail_page.dart';
import '../../features/login/pages/login_page.dart';
import '../../features/register/pages/register_page.dart';

class Routes {
  static List<GetPage> pages() {
    return [
      GetPage(name: loginPageRoute, page: () => const LoginPage()),
      GetPage(name: registerPageRoute, page: () => const RegisterPage()),
      GetPage(name: homePageRoute, page: () => HomePage()),
      GetPage(
        name: destinationDetailPageRoute,
        page: () => DestinationDetailPage(),
      ),
      GetPage(
        name: onboardingPageRoute,
        page: () => OnboardingPage(),
      ),
    ];
  }
}
