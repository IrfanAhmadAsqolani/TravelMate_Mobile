import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';

import '../../../../components/components.dart';
import '../../../../utils/utils.dart';

class RecommendedPlaceCard extends StatelessWidget {
  const RecommendedPlaceCard({
    Key? key,
    required this.name,
    required this.location,
    required this.invitationAvailable,
    required this.category,
    required this.imgUrl,
  }) : super(key: key);

  final String name;
  final String location;
  final int invitationAvailable;
  final int category;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  imgUrl,
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
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4.w),
                Row(
                  children: [
                    category == 0
                        ? const CategoryChip(
                            title: 'Pantai',
                            color: Color(0xFF7FDFFE),
                          )
                        : const CategoryChip(
                            title: 'Gunung',
                            color: Color(0xFFE4A342),
                          ),
                    SizedBox(width: 6.w),
                    Text(
                      location,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  '$invitationAvailable Invitations Available',
                  style: const TextStyle(fontSize: 12),
                ),
                SizedBox(height: 10.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
