import 'package:travelmate/features/destination_detail/repositories/repositories.dart';

import '../../../dependencies/dependencies.dart';
import '../../../models/models.dart';

class DestinationController extends GetxController {
  var invitations = <InvitationMdl>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    loadData();
  }

  void loadData() {
    getInvitations();
  }

  Future<void> getInvitations() async {
    isLoading.value = true;
    final repository = DestinationDetailRepositoryImpl();
    try {
      final response = await repository.getAllInvitations();
      invitations.value = RxList.from(response.allInvitations);
      isLoading.value = false;
    } on DioError catch (e) {
      throw e.toString();
    }
  }
}
