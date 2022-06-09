import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travelmate/dependencies/dependencies.dart';

import '../../../components/components.dart';
import '../../my_invitation_detail/pages/my_invitation_detail_page.dart';

const String myInvitationPageRoute = '/my-invitation';

class MyInvitationPage extends StatelessWidget {
  const MyInvitationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 35.w),
              const CenterTitleWithBack(
                title: 'My Invitation',
              ),
              SizedBox(height: 35.w),
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
                      Get.toNamed(myInvitationDetailPageRoute);
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                  height: 17.w,
                ),
                itemCount: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
