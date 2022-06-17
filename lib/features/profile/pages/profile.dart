import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/login/pages/login_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../components/components.dart';
import '../../../models/models.dart';
import '../../../utils/utils.dart';
import '../../my_invitation/pages/my_invitation_page.dart';

const String profilePageRoute = '/my-invitation';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Uri uri = Uri.parse('https://wa.me/6285155427717');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 35.w),
              SizedBox(height: 35.w),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35.w),
                  child: BigProfileCard(
                    user: UserMdl(
                      fullName: 'baguS seno',
                      pictUrl:
                          'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80',
                    ),
                  )),
              SizedBox(height: 40.w),
              Column(
                children: [
                  Divider(color: CustomColors.grey, thickness: 1.w),
                  InkWell(
                    onTap: () => Get.toNamed(myInvitationPageRoute),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.w),
                      child: Text(
                        'My Invitation',
                        style: TextStyles.heading5Regular(),
                      ),
                    ),
                  ),
                  Divider(color: CustomColors.grey, thickness: 1.w),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.w),
                    child: Text(
                      'Account Settings',
                      style: TextStyles.heading5Regular(),
                    ),
                  ),
                  Divider(color: CustomColors.grey, thickness: 1.w),
                  InkWell(
                    onTap: () => launchUrl(uri),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.w),
                      child: Text(
                        'Customer Service',
                        style: TextStyles.heading5Regular(),
                      ),
                    ),
                  ),
                  Divider(color: CustomColors.grey, thickness: 1.w),
                  InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Log out'),
                        content: const Text('Are you sure want to log out?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Get.toNamed(loginPageRoute),
                            child: const Text('Log out',
                                style: TextStyle(color: Colors.red)),
                          ),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.w),
                      child: Text(
                        'Log out',
                        style: TextStyles.heading5Regular(
                            color: CustomColors.danger),
                      ),
                    ),
                  ),
                  Divider(color: CustomColors.grey, thickness: 1.w),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
