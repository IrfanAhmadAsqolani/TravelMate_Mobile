import 'package:travelmate/features/destination_detail/repositories/repositories.dart';

import '../../../dependencies/dependencies.dart';
import '../../../models/models.dart';

class DestinationController extends GetxController {
  var invitations = <InvitationMdl>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() async {
    getInvitations();
  }

  Future<void> getInvitations() async {
    final repository = DestinationDetailRepositoryImpl();
    try {
      final response = await repository.getAllInvitations();
      invitations = RxList.from(response.allInvitations);
      isLoading.value = false;
    } on DioError catch (e) {
      throw e.toString();
    }
  }
}
