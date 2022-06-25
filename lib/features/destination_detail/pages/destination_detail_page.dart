import 'package:flutter/material.dart';
import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/invitation_create/pages/invitation_create_page.dart';
import 'package:travelmate/features/maps/maps_page.dart';
import 'package:travelmate/utils/utils.dart';

import '../../../components/components.dart';
import '../../../gen/assets.gen.dart';
import '../../../models/models.dart';
import '../controllers/controllers.dart';
import 'views/views.dart';

const String destinationDetailPageRoute = '/destination-detail';

class DestinationDetailPage extends StatelessWidget {
  DestinationDetailPage({
    Key? key,
  }) : super(key: key);

  final destination = Get.arguments as DestinationMdl;

  @override
  Widget build(BuildContext context) {
    final destinationController = Get.put(DestinationController(
      destinationId: destination.id,
    ));

    return Scaffold(
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () async => destinationController.loadData(),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 52.w),
                  Stack(
                    children: [
                      CenterTitleWithBack(
                        title: destination.name ?? '',
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 27.w),
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                mapsPageRoute,
                                arguments: MapsParam(
                                  locationName: destination.name,
                                  latitude: destination.latitude,
                                  longitude: destination.longitude,
                                ),
                              );
                            },
                            child: SvgPicture.asset(
                              // TODO(adityandar): change to map?
                              Assets.icons.icInvitation,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 35.w),
                  Container(
                    width: 1.sw,
                    height: 217.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          destination.imageUrl,
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
                        CategoryChip(
                          title: destination.category?.name ?? '',
                          color: CustomColors.grey.withOpacity(0.6),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          destination.province?.name ?? '',
                          style: TextStyles.heading5SemiBold(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 19.w),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.w),
                    child: Text(
                      destination.desc ?? '',
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
                  InvitationView(),
                  SizedBox(height: 100.w),
                ],
              ),
            ),
          ),
          Obx(() {
            if (destinationController.isUserVerified) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomButton.info(
                      text: "Create Invitation",
                      onTap: () async {
                        await Get.toNamed(invitationCreatePageRoute,
                            arguments: destination);
                        destinationController.loadData();
                      },
                    ),
                    SizedBox(height: 20.w),
                  ],
                ),
              );
            }
            return const SizedBox();
          })
        ],
      ),
    );
  }
}
