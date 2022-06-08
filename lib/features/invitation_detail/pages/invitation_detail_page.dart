import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:travelmate/components/components.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/utils/visual/visual.dart';

const String invitationDetailPageRoute = '/invitation-detail';

class InvitationDetailPage extends StatelessWidget {
  const InvitationDetailPage({Key? key}) : super(key: key);

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
                SizedBox(height: 8.w),
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
                  text: 'Requested to Join',
                  onTap: () {},
                  margin: EdgeInsets.zero,
                ),
                SizedBox(height: 44.w),
                Text(
                  'You might interest in',
                  style: TextStyles.heading5Regular(),
                ),
              ],
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
