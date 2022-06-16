import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/destination_detail/pages/destination_detail_page.dart';

import '../../../../models/models.dart';
import '../../../../utils/utils.dart';

class PopularDestinationCard extends StatelessWidget {
  const PopularDestinationCard({
    Key? key,
    required this.destination,
  }) : super(key: key);

  final DestinationMdl destination;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(
          destinationDetailPageRoute,
          arguments: destination,
        );
      },
      child: Container(
        width: 200.w,
        height: 152.w,
        margin: EdgeInsets.only(right: 15.w),
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
                    destination.imageUrl,
                  ),
                ),
              ),
            ),
            SizedBox(height: 7.w),
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Text(
                destination.name,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15.w),
              child: Text(
                destination.provinceId.toString(),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
