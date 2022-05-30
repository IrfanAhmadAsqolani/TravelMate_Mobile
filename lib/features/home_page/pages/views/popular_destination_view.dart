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
        SizedBox(
          height: 185.w,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: listPopular.length,
            separatorBuilder: (_, __) {
              return SizedBox(width: 15.w);
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: (index == 0)
                    ? EdgeInsets.only(left: 26.w)
                    : EdgeInsets.zero,
                child: PopularDestinationCard(
                  name: listPopular[index]['name'],
                  location: listPopular[index]['location'],
                  imgUrl: listPopular[index]['imgUrl'],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
