import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/dummy/popular_destination_dummy.dart';

import '../widgets/widgets.dart';

class PopularDestinationView extends StatelessWidget {
  PopularDestinationView({
    Key? key,
  }) : super(key: key);

  final listPopular = PopularDestinationDummy.list();

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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            children: [
              SizedBox(width: 26.w),
              ...listPopular
                  .map(
                    (item) => PopularDestinationCard(
                      name: item['name'],
                      location: item['location'],
                      imgUrl: item['imgUrl'],
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
      ],
    );
  }
}
