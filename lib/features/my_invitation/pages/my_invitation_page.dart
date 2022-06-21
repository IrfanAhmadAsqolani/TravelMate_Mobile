import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/my_invitation/controller/my_invitation_controller.dart';
import 'package:travelmate/features/my_invitation/pages/views/views.dart';


import '../../../components/components.dart';

const String myInvitationPageRoute = '/my-invitation';

class MyInvitationPage extends StatelessWidget {
  const MyInvitationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MyInvitationController());

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => Get.find<MyInvitationController>().loadData(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 35.w),
                const CenterTitleWithBack(
                  title: 'My Invitation',
                ),
                SizedBox(height: 35.w),
                MyInvitationView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
