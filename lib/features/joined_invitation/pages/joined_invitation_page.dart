import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';

import '../../../components/components.dart';
import '../../invitation_detail/pages/invitation_detail_page.dart';

const String joinedInvitationPageRoute = '/joined-invitation';

class JoinedInvitationPage extends StatelessWidget {
  const JoinedInvitationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 31.w),
          Padding(
            padding: EdgeInsets.only(left: 26.w),
            child: const Text(
              'Joined Invitation',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
            ),
          ),
          SizedBox(height: 19.w),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InvitationCard(
                  title: 'Touring Santai',
                  date: DateTime.now(),
                  creator: 'Agus Nur Hasyim',
                  number: 10,
                  onTap: () {
                    Get.toNamed(invitationDetailPageRoute);
                  },
                );
              },
              separatorBuilder: (context, index) => SizedBox(
                height: 17.w,
              ),
              itemCount: 10,
            ),
            SizedBox(height: 30.w),
        ],
      ),
    ));
  }
}
