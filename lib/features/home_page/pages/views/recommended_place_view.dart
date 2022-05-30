import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/dummy/recommended_places_dummy.dart';

import '../widgets/widgets.dart';

class RecommendedPlaceView extends StatelessWidget {
  RecommendedPlaceView({
    Key? key,
  }) : super(key: key);

  final listRecommended = RecommendedPlacesDummy.list();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 26.w),
          child: const Text(
            'Recommended Places',
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(height: 21.w),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: listRecommended.length,
          separatorBuilder: (_, __) {
            return SizedBox(height: 15.w);
          },
          itemBuilder: (context, index) {
            return RecommendedPlaceCard(
              name: listRecommended[index]['name'],
              location: listRecommended[index]['location'],
              invitationAvailable: listRecommended[index]
                  ['invitation_available'],
              category: listRecommended[index]['category'],
              imgUrl: listRecommended[index]['imgUrl'],
            );
          },
        ),
      ],
    );
  }
}
