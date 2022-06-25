import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/models/models.dart';
import 'package:travelmate/models/travel_buddy/create_travel_buddy_param.dart';

import '../../../network/network.dart';

class InvitationController extends GetxController with CacheManager {
  final isFormLoading = false.obs;
  final isLoading = false.obs;
  var TravelBuddy = Rxn<TravelBuddyMdl>().obs;
  

  Future<void> travelBuddyCreate(
      {required CreateTravelBuddyParam param}) async {
    isFormLoading.value = true;
    final user = getUserData();

    try {
      await Api().dio.post(
            'travel_buddies',
            data: param.copyWith(memberId: user?.id).toMap(),
          );
      getTravelBuddy(param.invitationId);
    } on DioError catch (e) {
      print(e);
      Get.snackbar('Error', 'Gagal register');
    } catch (e) {
      Get.snackbar('Error', 'Gagal register');
    }

    isFormLoading.value = false;
  }

  Future<void> getTravelBuddy(int invitationId) async {
    final user = getUserData();
    try {
      isLoading.value = true;
      final response = await Api().dio.get('travel_buddies', queryParameters: {
        'invitation_id': invitationId,
        'member_id': user?.id,
      });
      
      GetTravelBuddiesResponse resTravelBuddies =
          GetTravelBuddiesResponse.fromMap(
        response.data,
      );
      print(resTravelBuddies);
      if (resTravelBuddies.travelBuddies.isNotEmpty){
        TravelBuddy.value = resTravelBuddies.travelBuddies[0];
      }
      isLoading.value = false;
    } on DioError catch (e) {
      Get.snackbar('Error!', e.toString());
    }
  }


}
