 

import 'package:flutter/material.dart';
import 'package:travelmate/features/joined_invitation/controllers/joined_invitation_controller.dart';

import '../../../../components/components.dart';
import '../../../../dependencies/dependencies.dart';
import '../../../../models/models.dart';
import '../../../../utils/utils.dart';

class JoinedInvitationView extends StatelessWidget {
  JoinedInvitationView({Key? key}) : super(key: key);

  final joinedInvitationController = Get.find<JoinedInvitationController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (joinedInvitationController.isLoading.value) {
          return ShimmerContainer(
            width: 1.sw,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
          );
        }
        if (joinedInvitationController.joinedInvitations.isNotEmpty) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return InvitationCard(
                invitation: joinedInvitationController.joinedInvitations[index].invitation?? const InvitationMdl(),
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: 17.w,
            ),
            itemCount: joinedInvitationController.joinedInvitations.length,
          );
        }
        return Center(
          child: Text(
            'You have not joined any invitations yet',
            style: TextStyles.heading5Regular(),
          ),
        );
      },
    );
  }
}
