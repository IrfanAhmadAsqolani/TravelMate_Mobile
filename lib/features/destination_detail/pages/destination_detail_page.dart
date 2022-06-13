import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/dummy/recommended_places_dummy.dart';
import 'package:travelmate/features/invitation_detail/pages/invitation_detail_page.dart';
import 'package:travelmate/utils/utils.dart';

import '../../../components/components.dart';

const String destinationDetailPageRoute = '/destination-detail';

class DestinationDetailPage extends StatelessWidget {
  const DestinationDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 52.w),
                const CenterTitleWithBack(
                  title: 'Pantai Pangandaran',
                ),
                SizedBox(height: 35.w),
                Container(
                  width: 1.sw,
                  height: 217.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        RecommendedPlacesDummy.list().first['imgUrl'],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 19.w),
                Padding(
                  padding: EdgeInsets.only(left: 28.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CategoryChip(
                        title: 'Pantai',
                        color: Color(0xFF7FDFFE),
                      ),
                      SizedBox(width: 12.w),
                      Text(
                        'Jawa Barat',
                        style: TextStyles.heading5SemiBold(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 19.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Text(
                    'Pangandaran Regency is a Regency in West Java province, Indonesia, formed on 25 October 2012 out of the former southern portion of Ciamis Regency. The population of this area as at the 2010 Census was 383,848, and was 423,670 at the 2020 Census. The administrative capital is the town of Parigi.',
                    style: TextStyles.heading5Regular(),
                  ),
                ),
                SizedBox(height: 19.w),
                Padding(
                  padding: EdgeInsets.only(left: 28.w),
                  child: Text(
                    'Invitation',
                    style: TextStyles.heading4(),
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
                SizedBox(height: 100.w),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomButton.info(
                  text: "Create Invitation",
                  onTap: () {},
                ),
                SizedBox(height: 20.w),
              ],
            ),
          )
        ],
      ),
    );
  }
}
