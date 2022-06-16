import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';

import '../../../../components/components.dart';
import '../../../../models/models.dart';
import '../../../../utils/utils.dart';
import '../../../destination_detail/pages/destination_detail_page.dart';

class RecommendedPlaceCard extends StatelessWidget {
  const RecommendedPlaceCard({
    Key? key,
    required this.destination,
  }) : super(key: key);

  final DestinationMdl destination;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(
        destinationDetailPageRoute,
        arguments: destination,
      ),
      child: Container(
        width: 1.sw,
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        height: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.r),
          color: Colors.white,
          boxShadow: Shadows.defaultShadow(),
        ),
        child: Row(
          children: [
            Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    destination.imageUrl,
                  ),
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10.w),
                  Text(
                    destination.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 4.w),
                  Row(
                    children: [
                      // TODO(adityandar): change categoryname
                      CategoryChip(
                        title: destination.categoryId.toString(),
                        color: Color(0xFF7FDFFE),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        // TODO(adityandar): change provinceName
                        destination.provinceId.toString(),
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    // TODO(adityandar): change invitations
                    '0 Invitations Available',
                    style: const TextStyle(fontSize: 12),
                  ),
                  SizedBox(height: 10.w),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
