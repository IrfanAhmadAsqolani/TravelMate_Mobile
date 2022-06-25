import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';

import '../../../components/components.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/helpers.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';
import '../controller/my_invitation_detail_controller.dart';

const String myInvitationDetailPageRoute = '/my-invitation-detail';

class MyInvitationDetailPage extends StatefulWidget {
  const MyInvitationDetailPage({Key? key}) : super(key: key);

  @override
  State<MyInvitationDetailPage> createState() => _MyInvitationDetailPageState();
}

class _MyInvitationDetailPageState extends State<MyInvitationDetailPage> {
  final invitation = Get.arguments as InvitationMdl?;
  final myInvitationDetailController = Get.put(MyInvitationDetailController());

  @override
  void initState() {
    print(invitation!.destination);
    myInvitationDetailController.loadData(invitation?.id ?? 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 56.w),
            const CustomBackButton(),
            Padding(
              padding: EdgeInsets.only(left: 28.w, right: 28.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 26.w),
                  Text(
                    '${invitation?.destination?.name}',
                    style: TextStyles.heading7Regular(),
                  ),
                  SizedBox(height: 10.w),
                  Text(
                    invitation?.title ?? '',
                    style: TextStyles.heading4(),
                  ),
                  SizedBox(height: 10.w),
                  Text(
                    DateHelper.getReadableDate(invitation?.departDate),
                    style: TextStyles.heading5Regular(),
                  ),
                  SizedBox(height: 10.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      StatusChip(isOpen: invitation?.isOpen ?? false),
                      SizedBox(width: 10.w),
                      Text(
                        '${invitation?.maxTeam} persons',
                        style: TextStyles.heading5Regular(),
                      ),
                      SizedBox(width: 10.w),
                      if (invitation?.slotAvailable != null) ...[
                        Text(
                          '${invitation?.slotAvailable} available slot',
                          style: TextStyles.heading7Regular(color: Colors.blue),
                        ),
                      ],
                    ],
                  ),
                  SizedBox(height: 10.w),
                  Text(
                    invitation?.description ?? '',
                    style: TextStyles.heading5Regular(),
                  ),
                  SizedBox(height: 10.w),
                  SmallProfileCard(
                    user: invitation?.owner?.copyWith(fullName: 'You'),
                  ),
                  SizedBox(height: 44.w),
                  Text(
                    "Request List",
                    style: TextStyles.heading5SemiBold(),
                  ),
                  SizedBox(height: 10.w),
                  Obx(
                    () {
                      if (myInvitationDetailController.isLoading.value) {
                        return ShimmerContainer(
                          width: 1.sw,
                          margin: EdgeInsets.symmetric(horizontal: 16.w),
                        );
                      }
                      if (myInvitationDetailController
                          .myInvitationsRequest.isNotEmpty) {
                        return ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            return RequestCard(
                              travelBuddy: myInvitationDetailController
                                  .myInvitationsRequest[index],
                            );
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            height: 17.w,
                          ),
                          itemCount: myInvitationDetailController
                              .myInvitationsRequest.length,
                        );
                      }
                      return Center(
                        child: Text(
                          'There is no available request',
                          style: TextStyles.heading5Regular(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RequestCard extends StatelessWidget {
  const RequestCard({
    required this.travelBuddy,
    Key? key,
  }) : super(key: key);

  final TravelBuddyMdl travelBuddy;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: Shadows.defaultShadow(),
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      width: 328.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 10.w,
            ),
            child: Text(
              travelBuddy.message ?? '',
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 10.w,
            ),
            child: Row(
              children: [
                Expanded(
                  child: SmallProfileCard(user: travelBuddy.user),
                ),
                if (travelBuddy.status == 0) ...[
                  InkWell(
                    child: SvgPicture.asset(
                      Assets.icons.icApprove,
                    ),
                    onTap: () {
                      Get.find<MyInvitationDetailController>()
                          .approveMyInvitationsRequest(travelBuddy);
                    },
                  ),
                  SizedBox(width: 10.w),
                  InkWell(
                    child: SvgPicture.asset(
                      Assets.icons.icReject,
                    ),
                    onTap: () {
                      Get.find<MyInvitationDetailController>()
                          .rejectMyInvitationsRequest(travelBuddy);
                    },
                  ),
                ] else ...[
                  Text((travelBuddy.status == 1) ? 'Approved' : 'Rejected')
                ],
              ],
            ),
          )
        ],
      ),
    );
  }
}
