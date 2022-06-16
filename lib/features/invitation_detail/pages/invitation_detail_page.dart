import 'package:flutter/material.dart';
import 'package:travelmate/components/components.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/invitation_detail/controllers/invitation_controller.dart';
import 'package:travelmate/helpers/date_helper.dart';
import 'package:travelmate/models/models.dart';
import 'package:travelmate/utils/utils.dart';

const String invitationDetailPageRoute = '/invitation-detail';

class InvitationDetailPage extends StatefulWidget {
  const InvitationDetailPage({Key? key}) : super(key: key);

  @override
  State<InvitationDetailPage> createState() => _InvitationDetailPageState();
}

class _InvitationDetailPageState extends State<InvitationDetailPage> {
  final invitation = Get.arguments as InvitationMdl?;
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Get.put(InvitationController());

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 52.w),
          const CustomBackButton(),
          Padding(
            padding: EdgeInsets.only(left: 28.w, right: 28.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 26.w),
                Text(
                  '${invitation?.destinationId}',
                  style: TextStyles.heading7Regular(),
                ),
                SizedBox(height: 8.w),
                Text(
                  invitation?.title ?? '',
                  style: TextStyles.heading4(),
                ),
                SizedBox(height: 8.w),
                Text(
                  DateHelper.getReadableDate(invitation?.createdAt),
                  style: TextStyles.heading5Regular(),
                ),
                SizedBox(height: 8.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const StatusChip(isOpen: true),
                    SizedBox(width: 8.w),
                    Text(
                      '${invitation?.maxTeam} persons',
                      style: TextStyles.heading5Regular(),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '1 available slot', // TODO(adityandar): fix this
                      style: TextStyles.heading7Regular(color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(height: 8.w),
                Text(
                  invitation?.description ?? '',
                  style: TextStyles.heading5Regular(),
                ),
                SizedBox(height: 10.w),
                SmallProfileCard(
                  name: 'Cameron Steward',
                  time: DateTime.now(),
                  imgUrl: 'https://via.placeholder.com/150',
                ),
                SizedBox(height: 10.w),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: Shadows.defaultShadow(),
                  ),
                  child: TextFormField(
                    controller: _messageController,
                    decoration: CustomInputDecoration.formDecoration(
                      'Add Message',
                    ),
                    maxLines: null,
                    minLines: 2,
                    maxLength: 100,
                  ),
                ),
                SizedBox(height: 10.w),
                CustomButton.info(
                  text: 'Request to Join',
                  onTap: () =>
                      Get.find<InvitationController>().createInvitation(
                    CreateInvitationParam(
                      memberId: 2,
                      invitationId: 3,
                      message: _messageController.text,
                    ),
                  ),
                  margin: EdgeInsets.zero,
                ),
                SizedBox(height: 44.w),
                Text(
                  'You might interest in',
                  style: TextStyles.heading5SemiBold(),
                ),
              ],
            ),
          ),
          SizedBox(height: 19.w),
          // TODO(adityandar): implement when see others available
          // ListView.separated(
          //   shrinkWrap: true,
          //   physics: const NeverScrollableScrollPhysics(),
          //   padding: EdgeInsets.zero,
          //   itemBuilder: (context, index) {
          //     return InvitationCard(
          //       invitation: InvitationMdl(),
          //       onTap: () {
          //         Get.toNamed(invitationDetailPageRoute);
          //       },
          //     );
          //   },
          //   separatorBuilder: (context, index) => SizedBox(
          //     height: 17.w,
          //   ),
          //   itemCount: 10,
          // ),
          SizedBox(height: 30.w),
        ],
      ),
    ));
  }
}
