import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/models/travel_buddy/create_travel_buddy_param.dart';

import '../../../network/network.dart';

class InvitationController extends GetxController with CacheManager {
  final isFormLoading = false.obs;

  Future<void> travelBuddyCreate(
      {required CreateTravelBuddyParam param}) async {
    isFormLoading.value = true;
    final user = getUserData();

    try {
      await Api().dio.post(
            'travel_buddies',
            data: param.copyWith(memberId: user?.id).toMap(),
          );
      // Get.back();
    } on DioError catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to join invitation.');
    } catch (e) {
      Get.snackbar('Error', 'Failed to join invitation.');
    }

    isFormLoading.value = false;
  }
}
