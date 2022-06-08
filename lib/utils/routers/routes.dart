import 'package:travelmate/features/home_page/pages/home_page.dart';

import '../../dependencies/dependencies.dart';
import '../../features/destination_detail/pages/destination_detail_page.dart';
import '../../features/invitation_detail/pages/invitation_detail_page.dart';
import '../../features/joined_invitation/pages/joined_invitation_page.dart';
import '../../features/login/pages/login_page.dart';
import '../../features/my_invitation/pages/my_invitation_page.dart';
import '../../features/my_invitation_detail/pages/my_invitation_detail_page.dart';
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
        name: invitationDetailPageRoute,
        page: () => InvitationDetailPage(),
      ),
      GetPage(
        name: joinedInvitationPageRoute,
        page: () =>JoinedInvitationPage(),
      ),
      GetPage(
        name: myInvitationPageRoute,
        page: () =>MyInvitationPage(),
      ),
      GetPage(
        name: myInvitationDetailPageRoute,
        page: () =>MyInvitationDetailPage(),
      ),
    ];
  }
}
