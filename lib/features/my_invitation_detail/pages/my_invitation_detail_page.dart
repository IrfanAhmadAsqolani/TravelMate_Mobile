import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travelmate/dependencies/dependencies.dart';

import '../../../components/components.dart';
import '../../../utils/utils.dart';

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
            SizedBox(height: 26.w),
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
                SizedBox(height: 8.w),
                Text(
                  'Touring Santai',
                  style: TextStyles.heading4(),
                ),
                SizedBox(height: 8.w),
                Text(
                  '24 Juli 2022',
                  style: TextStyles.heading5Regular(),
                ),
                SizedBox(height: 8.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StatusChip(isOpen: true),
                    SizedBox(width: 8.w),
                    Text(
                      '10 persons',
                      style: TextStyles.heading5Regular(),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '3 available slot',
                      style: TextStyles.heading7Regular(color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(height: 8.w),
                Text(
                  'Jadi inget nasehat alm nenek waktu abang gw lagi nikahan, dia nasihatin pas gw lagi duduk di samping sound sistem dan sampe sekarang gw gatau apa nasihatnya karna ga kedengeran Intinya ayo kita touring, prefer dom bandung. untuk budget palingan 500rb udah cukup',
                  style: TextStyles.heading5Regular(),
                ),
                SizedBox(height: 8.w),
                CustomButton.info(
                  text: 'edit',
                  onTap: () {},
                  margin: EdgeInsets.zero,
                ),
                SizedBox(height: 8.w),
                CustomButton.info(
                  text: 'Close Invitation',
                  onTap: () {},
                  margin: EdgeInsets.zero,
                ),
                SizedBox(height: 44.w),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}