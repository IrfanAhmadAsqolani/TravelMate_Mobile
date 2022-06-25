import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/home_page/pages/home_page.dart';
import 'package:travelmate/features/joined_invitation/pages/joined_invitation_page.dart';
import 'package:travelmate/features/profile/pages/profile.dart';
import 'package:travelmate/features/search/pages/search_page.dart';
import 'package:travelmate/utils/visual/visual.dart';

import '../../gen/assets.gen.dart';

const String mainPageRoute = '/main-page';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          HomePage(),
          SearchPage(),
          JoinedInvitationPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 16,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.icHome,
              color: (_currentIndex == 0)
                  ? CustomColors.primary
                  : CustomColors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.icSearch,
              color: (_currentIndex == 1)
                  ? CustomColors.primary
                  : CustomColors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.icInvitation,
              color: (_currentIndex == 2)
                  ? CustomColors.primary
                  : CustomColors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              Assets.icons.icProfile,
              color: (_currentIndex == 3)
                  ? CustomColors.primary
                  : CustomColors.black,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
