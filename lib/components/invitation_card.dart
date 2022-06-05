import 'package:flutter/material.dart';
import 'package:travelmate/components/components.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/utils/utils.dart';

class InvitationCard extends StatelessWidget {
  const InvitationCard({
    Key? key,
    required this.title,
    required this.date,
    required this.creator,
    required this.number,
    required this.onTap,
    this.isOpen = false,
  }) : super(key: key);

  final String title;
  final DateTime date;
  final String creator;
  final int number;
  final VoidCallback onTap;
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.fromLTRB(24.w, 11.w, 0.w, 11.w),
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: Shadows.defaultShadow(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.heading5SemiBold(),
              ),
              SizedBox(height: 5.w),
              Text(
                date.toString(), // TODO(adityandar): change to correct style
                style: TextStyles.heading7Regular(),
              ),
              SizedBox(height: 5.w),
              Text(
                'Created by $creator',
                style: TextStyles.heading7Regular(
                  color: CustomColors.grey,
                ),
              ),
              SizedBox(height: 5.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StatusChip(isOpen: isOpen),
                  SizedBox(width: 9.w),
                  Text(
                    '$number Persons',
                    style: TextStyles.heading7Regular(),
                  ),
                ],
              ),
            ],
          ),
          // TODO(adityandar): implement icon
          // IconButton(
          //   onPressed: onTap,
          //   icon: Icons.chevron_right_rounded,
          //   s
          // )
        ],
      ),
    );
  }
}