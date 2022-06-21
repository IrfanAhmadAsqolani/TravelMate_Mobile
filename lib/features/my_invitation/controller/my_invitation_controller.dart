import 'package:travelmate/dependencies/dependencies.dart';

import '../../../models/models.dart';
import '../../../network/network.dart';

class MyInvitationController extends GetxController {
  var myInvitations = <InvitationMdl>[].obs;
  var isLoading = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() {
    getMyInvitations();
  }

  Future<void> getMyInvitations() async {
    // TODO(irfanahmad): change to owner id menggunakan user id
    var ownerId = 1;
    try {
      isLoading.value = true;
      final response = await Api().dio.get('invitations');
      GetAllInvitationsResponse resInvitation = GetAllInvitationsResponse.fromMap(
        response.data,
      );
      List<InvitationMdl> invitationTemp = [];
      for (var eachInvitation in resInvitation.allInvitations) {
        if (eachInvitation.owner?.id == ownerId) {
          invitationTemp.add(eachInvitation);
        }
      }
      myInvitations.value = RxList.from(invitationTemp);
      isLoading.value = false;
    } on DioError catch (e) {
      Get.snackbar('Error!', e.toString());
    }
  }

}
