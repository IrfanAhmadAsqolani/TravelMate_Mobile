import 'package:flutter/material.dart';

import 'package:travelmate/features/my_invitation/controller/my_invitation_controller.dart';

import '../../../../components/components.dart';
import '../../../../dependencies/dependencies.dart';
import '../../../../utils/utils.dart';

class MyInvitationView extends StatelessWidget {
  MyInvitationView({Key? key}) : super(key: key);

  final myInvitationController = Get.find<MyInvitationController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (myInvitationController.isLoading.value) {
          return ShimmerContainer(
            width: 1.sw,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
          );
        }
        if (myInvitationController.myInvitations.isNotEmpty) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return InvitationCard(
                invitation: myInvitationController.myInvitations[index],
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: 17.w,
            ),
            itemCount: myInvitationController.myInvitations.length,
          );
        }
        return Center(
          child: Text(
            'There is no available invitation',
            style: TextStyles.heading5Regular(),
          ),
        );
      },
    );
  }
}
