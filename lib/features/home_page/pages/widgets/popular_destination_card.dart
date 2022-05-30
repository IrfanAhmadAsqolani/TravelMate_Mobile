import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';

import '../../../../utils/utils.dart';

class PopularDestinationCard extends StatelessWidget {
  const PopularDestinationCard({
    Key? key,
    required this.name,
    required this.location,
    required this.imgUrl,
  }) : super(key: key);

  final String name;
  final String location;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.w,
      height: 152.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: Shadows.defaultShadow(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200.w,
            height: 105.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  imgUrl,
                ),
              ),
            ),
          ),
          SizedBox(height: 7.w),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w),
            child: Text(
              location,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
