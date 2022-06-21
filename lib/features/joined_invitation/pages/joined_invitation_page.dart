import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/joined_invitation/controllers/joined_invitation_controller.dart';
import 'package:travelmate/features/joined_invitation/pages/views/views.dart';

const String joinedInvitationPageRoute = '/joined-invitation';

class JoinedInvitationPage extends StatelessWidget {
  const JoinedInvitationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(JoinedInvitationController());

    return Scaffold(
        body: SafeArea(
      child: RefreshIndicator(
        onRefresh: () async => Get.find<JoinedInvitationController>().loadData(),
        child: SingleChildScrollView(
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
              JoinedInvitationView(),
              SizedBox(height: 30.w),
            ],
          ),
        ),
      ),
    ));
  }
}
