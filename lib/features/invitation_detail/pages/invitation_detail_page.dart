import 'package:flutter/material.dart';
import 'package:travelmate/components/components.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/invitation_detail/controllers/invitation_controller.dart';
import 'package:travelmate/gen/assets.gen.dart';
import 'package:travelmate/helpers/date_helper.dart';
import 'package:travelmate/models/models.dart';
import 'package:travelmate/models/travel_buddy/create_travel_buddy_param.dart';
import 'package:travelmate/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

const String invitationDetailPageRoute = '/invitation-detail';

class InvitationDetailPage extends StatefulWidget {
  const InvitationDetailPage({Key? key}) : super(key: key);

  @override
  State<InvitationDetailPage> createState() => _InvitationDetailPageState();
}

class _InvitationDetailPageState extends State<InvitationDetailPage> {
  final invitation = Get.arguments as InvitationMdl?;
  final TextEditingController _messageController = TextEditingController();
  final InvitationController _invitationController =
      Get.put(InvitationController());

  @override
  void initState() {
    super.initState();
    _invitationController.getTravelBuddy(invitation?.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
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
                  '${invitation?.destination?.name}',
                  style: TextStyles.heading7Regular(),
                ),
                SizedBox(height: 8.w),
                Text(
                  invitation?.title ?? '',
                  style: TextStyles.heading4(),
                ),
                SizedBox(height: 8.w),
                Text(
                  DateHelper.getReadableDate(invitation?.departDate),
                  style: TextStyles.heading5Regular(),
                ),
                SizedBox(height: 8.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StatusChip(isOpen: invitation?.isOpen ?? false),
                    SizedBox(width: 8.w),
                    Text(
                      '${invitation?.maxTeam} persons',
                      style: TextStyles.heading5Regular(),
                    ),
                    SizedBox(width: 8.w),
                    if (invitation?.slotAvailable != null) ...[
                      Text(
                        '${invitation?.slotAvailable} available slot',
                        style: TextStyles.heading7Regular(color: Colors.blue),
                      ),
                    ],
                  ],
                ),
                SizedBox(height: 8.w),
                Text(
                  invitation?.description ?? '',
                  style: TextStyles.heading5Regular(),
                ),
                SizedBox(height: 10.w),
                SmallProfileCard(
                  user: invitation?.owner,
                ),
                SizedBox(height: 10.w),
                if (invitation?.isOpen ?? false) ...[
                  if (!_invitationController.isUserVerified) ...[
                    CustomButton.inactive(
                      text: 'Request to Join',
                      margin: EdgeInsets.zero,
                    ),
                  ] else if (_invitationController.userId ==
                      invitation?.ownerId) ...[
                    CustomButton.danger(
                      text: 'Not Available',
                      onTap: () {
                        Get.snackbar(
                          'Error',
                          'You can not join to your own invitation.',
                        );
                      },
                      margin: EdgeInsets.zero,
                    ),
                  ] else ...[
                    Obx(
                      (() {
                        if (_invitationController.TravelBuddy.value == null) {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: Shadows.defaultShadow(),
                                ),
                                child: TextFormField(
                                  controller: _messageController,
                                  decoration:
                                      CustomInputDecoration.formDecoration(
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
                                onTap: () {
                                  _invitationController.travelBuddyCreate(
                                      param: CreateTravelBuddyParam(
                                          memberId: 0,
                                          invitationId: invitation?.id ?? 0,
                                          status: 0,
                                          message: _messageController.text));
                                },
                                margin: EdgeInsets.zero,
                              ),
                            ],
                          );
                        } else {
                          if (_invitationController.TravelBuddy.value?.status ==
                              0) {
                            return CustomButton.inactive(
                              text: 'Requested',
                              margin: EdgeInsets.zero,
                            );
                          } else if (_invitationController
                                  .TravelBuddy.value?.status ==
                              1) {
                            return CustomButton.success(
                              text: '',
                              onTap: () async {
                                final url =
                                    Uri.tryParse(invitation?.groupUrl ?? '');
                                if (url != null) {
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  } else {
                                    Get.snackbar('Error', 'Can not launch url');
                                  }
                                }
                              },
                              margin: EdgeInsets.zero,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(Assets.icons.icWa.path),
                                  SizedBox(width: 5.w),
                                  Text(
                                    'Join Group',
                                    style: TextStyles.heading5SemiBold(
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            );
                          } else if (_invitationController
                                  .TravelBuddy.value?.status ==
                              2) {
                            return CustomButton.danger(
                              text: 'Not Available',
                              onTap: () {
                                Get.snackbar('Invitation Closed',
                                    "This invitation has been closed");
                              },
                              margin: EdgeInsets.zero,
                            );
                          }
                        }
                        return const SizedBox();
                      }),
                    ),
                  ],
                ] else ...[
                  CustomButton.danger(
                    text: 'Not Available',
                    onTap: () {
                      Get.snackbar('Invitation Closed',
                          "This invitation has been closed");
                    },
                    margin: EdgeInsets.zero,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
