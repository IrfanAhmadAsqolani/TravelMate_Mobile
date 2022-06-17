import 'package:flutter/material.dart';
import 'package:travelmate/features/destination_detail/controllers/controllers.dart';

import '../../../../components/components.dart';
import '../../../../dependencies/dependencies.dart';
import '../../../../utils/utils.dart';

class InvitationView extends StatelessWidget {
  InvitationView({Key? key}) : super(key: key);

  final destinationController = Get.find<DestinationController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (destinationController.isLoading.value) {
          return ShimmerContainer(
            width: 1.sw,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
          );
        }
        if (destinationController.invitations.isNotEmpty) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return InvitationCard(
                invitation: destinationController.invitations[index],
              );
            },
            separatorBuilder: (context, index) => SizedBox(
              height: 17.w,
            ),
            itemCount: destinationController.invitations.length,
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
