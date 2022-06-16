import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travelmate/dependencies/dependencies.dart';

import '../../../components/components.dart';
import '../../../gen/assets.gen.dart';
import '../../../utils/utils.dart';
import '../../invitation_edit/pages/invitation_edit_page.dart';

const String myInvitationDetailPageRoute = '/my-invitation-detail';

class MyInvitationDetailPage extends StatelessWidget {
  const MyInvitationDetailPage({Key? key}) : super(key: key);

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
                    'Pantai Pangandaran',
                    style: TextStyles.heading7Regular(),
                  ),
                  SizedBox(height: 10.w),
                  Text(
                    'Touring Santai',
                    style: TextStyles.heading4(),
                  ),
                  SizedBox(height: 10.w),
                  Text(
                    '24 Juli 2022',
                    style: TextStyles.heading5Regular(),
                  ),
                  SizedBox(height: 10.w),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      StatusChip(isOpen: true),
                      SizedBox(width: 10.w),
                      Text(
                        '10 persons',
                        style: TextStyles.heading5Regular(),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '3 available slot',
                        style: TextStyles.heading7Regular(color: Colors.blue),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.w),
                  Text(
                    'Jadi inget nasehat alm nenek waktu abang gw lagi nikahan, dia nasihatin pas gw lagi duduk di samping sound sistem dan sampe sekarang gw gatau apa nasihatnya karna ga kedengeran Intinya ayo kita touring, prefer dom bandung. untuk budget palingan 500rb udah cukup',
                    style: TextStyles.heading5Regular(),
                  ),
                  SizedBox(height: 10.w),
                  SmallProfileCard(
                    name: 'You',
                    time: DateTime.now(),
                    imgUrl: 'https://via.placeholder.com/150',
                  ),
                  SizedBox(height: 10.w),
                  CustomOutlinedButton.info(
                    text: 'Edit',
                    onTap: () {
                      Get.toNamed(
                        invitationEditPageRoute,
                      );
                    },
                    margin: EdgeInsets.zero,
                  ),
                  SizedBox(height: 10.w),
                  CustomButton.info(
                    text: 'Close Invitation',
                    onTap: () {},
                    margin: EdgeInsets.zero,
                  ),
                  SizedBox(height: 44.w),
                  Text(
                    "Request List",
                    style: TextStyles.heading5SemiBold(),
                  ),
                  SizedBox(height: 10.w),
                  RequestCard(
                      reqMessage:
                          "Pengen ikutttttttttt, Jikalau telah datang waktu yang dinanti Ku pasti bahagiakan dirimu seorang Kuharap dikau sabar menunggu"),
                  SizedBox(height: 10.w),
                  RequestCard(
                    reqMessage: "Gamau ikut sih iseng doang",
                  ),
                  SizedBox(height: 10.w),
                  RequestCard(
                    reqMessage: "Mau ikut dong belum pernah liat pantai :(",
                  ),
                  SizedBox(height: 30.w),
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
    required this.reqMessage,
    Key? key,
  }) : super(key: key);

  final String reqMessage;

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
              reqMessage,
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
                  child: SmallProfileCard(
                    name: 'Cameron Steward',
                    time: DateTime.now(),
                    imgUrl: 'https://via.placeholder.com/150',
                  ),
                ),
                InkWell(
                  child: SvgPicture.asset(
                    Assets.icons.icApprove,
                  ),
                  onTap: () {},
                ),
                SizedBox(width: 10.w),
                InkWell(
                  child: SvgPicture.asset(
                    Assets.icons.icReject,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
