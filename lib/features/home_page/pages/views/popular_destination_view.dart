import 'package:flutter/material.dart';
import 'package:travelmate/components/components.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/home_page/controllers/home_controller.dart';

import '../../../../utils/utils.dart';
import '../widgets/widgets.dart';

class PopularDestinationView extends StatelessWidget {
  PopularDestinationView({
    Key? key,
  }) : super(key: key);

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 26.w),
          child: const Text(
            'Popular destinations',
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 15.w),
        Obx(
          () {
            if (homeController.isLoading.value) {
              return Padding(
                padding: EdgeInsets.only(left: 26.w),
                child: ShimmerContainer(
                  width: 200.w,
                  height: 152.w,
                  radius: 15.r,
                ),
              );
            } else {
              if (homeController.popularDestinations.isNotEmpty) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(
                    children: [
                      SizedBox(width: 26.w),
                      ...homeController.popularDestinations
                          .map(
                            (destination) => PopularDestinationCard(
                              destination: destination,
                            ),
                          )
                          .toList(),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Text(
                    'Kosong',
                    style: TextStyles.heading3(),
                  ),
                );
              }
            }
          },
        ),
      ],
    );
  }
}
