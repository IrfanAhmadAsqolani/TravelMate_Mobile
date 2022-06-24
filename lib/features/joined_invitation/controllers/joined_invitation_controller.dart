

import 'package:travelmate/dependencies/dependencies.dart';

import '../../../models/models.dart';
import '../../../network/network.dart';

class JoinedInvitationController extends GetxController with CacheManager{
  var joinedInvitations = <TravelBuddyMdl>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    getJoinedInvitations();
  }

  Future<void> getJoinedInvitations() async {
    // TODO(irfanahmad): change to member id menggunakan user id
    final user = getUserData();
    print(user?.id);
    // var memberId = 1;
    try {
      isLoading.value = true;
      final response = await Api().dio.get('travel_buddies', queryParameters: {'member_id': user?.id });
      GetTravelBuddiesResponse resJoinedInvitation = GetTravelBuddiesResponse.fromMap(
        response.data,
      );
      joinedInvitations.value = RxList.from(resJoinedInvitation.travelBuddies);
      isLoading.value = false;
    } on DioError catch (e) {
      // Get.snackbar('Error!', e.toString());
      // Todo ganti response api
      print(e.response?.statusCode);
      if (e.response?.statusCode == 404) {
        joinedInvitations == [];
      } else {
        Get.snackbar('Error!', e.toString());
      }
      isLoading.value = false;
    }
  }

}