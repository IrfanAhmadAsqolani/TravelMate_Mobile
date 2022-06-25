import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/search/controllers/search_controller.dart';
import 'package:travelmate/utils/utils.dart';

import '../../home_page/pages/widgets/widgets.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  final searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (searchController.isLoading.value) {
          return Container(
            width: 1.sw,
            height: 1.sw,
            color: Colors.white.withOpacity(0.6),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 31.w),
              Padding(
                padding: EdgeInsets.only(left: 26.w),
                child: const Text(
                  'Search',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: CustomInputDecoration.formDecoration(
                    'Where do you wanna go?',
                  ).copyWith(
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (val) {
                    searchController.changeQuery(val);
                  },
                ),
              ),
              if (searchController.isInSearchMode) ...[
                if (searchController.results.isEmpty) ...[
                  SizedBox(
                    width: 1.sw,
                    child: Column(
                      children: [
                        SizedBox(height: 169.w),
                        Text(
                          'No Result Found',
                          style: TextStyles.heading5Regular(),
                        ),
                        SizedBox(height: 8.w),
                        Text(
                          'We did not find any places for your search',
                          style: TextStyles.heading7Regular(),
                        ),
                      ],
                    ),
                  ),
                ] else ...[
                  ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    clipBehavior: Clip.none,
                    itemCount: searchController.results.length,
                    separatorBuilder: (_, __) {
                      return SizedBox(height: 15.w);
                    },
                    itemBuilder: (context, index) {
                      return RecommendedPlaceCard(
                        destination: searchController.results[index],
                      );
                    },
                  ),
                ],
              ],
            ],
          ),
        );
      }),
    );
  }
}
