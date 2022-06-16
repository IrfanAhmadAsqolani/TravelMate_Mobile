import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/models/models.dart';

import '../../../network/network.dart';

class InvitationController extends GetxController {
  var isLoading = false.obs;

  Future<void> createInvitation(CreateInvitationParam param) async {
    isLoading.value = true;
    await Api().dio.post(
          'travel_buddies',
          data: param.toMap(),
        );
    isLoading.value = false;
  }
}
