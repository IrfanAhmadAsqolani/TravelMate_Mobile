// ignore_for_file: prefer_const_constructors

import 'package:travelmate/features/home_page/pages/home_page.dart';
import 'package:travelmate/features/main_page/main_page.dart';
import 'package:travelmate/features/maps/maps_page.dart';
import 'package:travelmate/features/onboarding/pages/onboarding_page.dart';
import 'package:travelmate/features/profile/pages/profile.dart';
import 'package:travelmate/features/splash/pages/splash_page.dart';

import '../../dependencies/dependencies.dart';
import '../../features/destination_detail/pages/destination_detail_page.dart';
import '../../features/invitation_create/pages/invitation_create_page.dart';
import '../../features/invitation_detail/pages/invitation_detail_page.dart';
import '../../features/invitation_edit/pages/invitation_edit_page.dart';
import '../../features/joined_invitation/pages/joined_invitation_page.dart';
import '../../features/login/pages/login_page.dart';
import '../../features/my_invitation/pages/my_invitation_page.dart';
import '../../features/my_invitation_detail/pages/my_invitation_detail_page.dart';
import '../../features/register/pages/register_page.dart';

class Routes {
  static List<GetPage> pages() {
    return [
      GetPage(name: splashPageRoute, page: () => SplashPage()),
      GetPage(name: loginPageRoute, page: () => LoginPage()),
      GetPage(name: registerPageRoute, page: () => RegisterPage()),
      GetPage(name: homePageRoute, page: () => HomePage()),
      GetPage(
        name: destinationDetailPageRoute,
        page: () => DestinationDetailPage(),
      ),
      GetPage(
        name: onboardingPageRoute,
        page: () => OnboardingPage(),
      ),
      GetPage(
        name: mainPageRoute,
        page: () => MainPage(),
      ),
      GetPage(
        name: invitationDetailPageRoute,
        page: () => InvitationDetailPage(),
      ),
      GetPage(
        name: joinedInvitationPageRoute,
        page: () => JoinedInvitationPage(),
      ),
      GetPage(
        name: myInvitationPageRoute,
        page: () => MyInvitationPage(),
      ),
      GetPage(
        name: myInvitationDetailPageRoute,
        page: () => MyInvitationDetailPage(),
      ),
      GetPage(
        name: invitationCreatePageRoute,
        page: () => InvitationCreatePage(),
      ),
      GetPage(
        name: invitationEditPageRoute,
        page: () => InvitationEditPage(),
      ),
      GetPage(
        name: profilePageRoute,
        page: () => ProfilePage(),
      ),
      GetPage(
        name: mapsPageRoute,
        page: () => MapsPage(),
      ),
    ];
  }
}
