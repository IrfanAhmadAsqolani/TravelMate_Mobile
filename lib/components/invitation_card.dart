import 'package:flutter/material.dart';
import 'package:travelmate/components/components.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/invitation_detail/pages/invitation_detail_page.dart';
import 'package:travelmate/network/network.dart';
import 'package:travelmate/utils/utils.dart';

import '../features/my_invitation_detail/pages/my_invitation_detail_page.dart';
import '../helpers/helpers.dart';
import '../models/models.dart';

class InvitationCard extends StatelessWidget with CacheManager {
  const InvitationCard({
    Key? key,
    required this.invitation,
  }) : super(key: key);

  final InvitationMdl invitation;

  @override
  Widget build(BuildContext context) {
    final user = getUserData();

    return InkWell(
      onTap: () => Get.toNamed(
        (user?.id == invitation.id)
            ? myInvitationDetailPageRoute
            : invitationDetailPageRoute,
        arguments: invitation,
      ),
      child: Container(
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    invitation.title ?? '',
                    style: TextStyles.heading5SemiBold(),
                  ),
                  SizedBox(height: 5.w),
                  Text(
                    DateHelper.getReadableDate(invitation.departDate),
                    style: TextStyles.heading7Regular(),
                  ),
                  SizedBox(height: 5.w),
                  Text(
                    'Created by ${invitation.owner?.username ?? ''}',
                    style: TextStyles.heading7Regular(
                      color: CustomColors.grey,
                    ),
                  ),
                  SizedBox(height: 5.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      StatusChip(isOpen: invitation.isOpen),
                      SizedBox(width: 9.w),
                      Text(
                        '${invitation.maxTeam} Persons',
                        style: TextStyles.heading7Regular(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 8.w),
            const Icon(Icons.chevron_right_rounded),
            SizedBox(width: 24.w),
          ],
        ),
      ),
    );
  }
}
