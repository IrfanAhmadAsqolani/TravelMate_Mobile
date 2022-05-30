import 'package:travelmate/features/home_page/pages/home_page.dart';

import '../../dependencies/dependencies.dart';

class Routes {
  static List<GetPage> pages() {
    return [
      GetPage(name: homePageRoute, page: () => HomePage()),
    ];
  }
}
