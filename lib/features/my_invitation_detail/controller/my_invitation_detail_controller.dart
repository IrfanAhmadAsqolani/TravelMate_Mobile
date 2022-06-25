import 'package:travelmate/dependencies/dependencies.dart';

import '../../../models/models.dart';
import '../../../network/network.dart';

class MyInvitationDetailController extends GetxController with CacheManager {
  var myInvitationsRequest = <TravelBuddyMdl>[].obs;
  var isLoading = false.obs;
  var invitationId = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void loadData(int id) {
    invitationId.value = id;
    getMyInvitationsRequest();
  }

  Future<void> getMyInvitationsRequest() async {
    try {
      isLoading.value = true;
      final response = await Api().dio.get('travel_buddies',
          queryParameters: {'invitation_id': invitationId});
      GetTravelBuddiesResponse resTravelBuddies =
          GetTravelBuddiesResponse.fromMap(
        response.data,
      );
      myInvitationsRequest.value = RxList.from(resTravelBuddies.travelBuddies);
      isLoading.value = false;
    } on DioError catch (e) {
      Get.snackbar('Error!', e.toString());
    }
  }
}
