import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/home_page/controllers/home_controller.dart';

import 'views/views.dart';

const String homePageRoute = '/home-page'; //

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => Get.find<HomeController>().loadData(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 31.w),
                Padding(
                  padding: EdgeInsets.only(left: 26.w),
                  child: const Text(
                    'Explore Now!',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 28,
                    ),
                  ),
                ),
                SizedBox(height: 21.w),
                PopularDestinationView(),
                SizedBox(height: 21.w),
                RecommendedPlaceView(),
                SizedBox(height: 50.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
