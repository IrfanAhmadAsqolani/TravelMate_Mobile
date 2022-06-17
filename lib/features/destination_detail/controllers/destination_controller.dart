import 'package:travelmate/features/destination_detail/repositories/repositories.dart';

import '../../../dependencies/dependencies.dart';
import '../../../models/models.dart';

class DestinationController extends GetxController {
  DestinationController({this.destinationId});

  final int? destinationId;
  var invitations = <InvitationMdl>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    loadData();
  }

  void loadData() {
    getAllInvitations();
  }

  Future<void> getAllInvitations() async {
    isLoading.value = true;
    final repository = DestinationDetailRepositoryImpl();
    try {
      final response = await repository.getAllInvitations();
      List<InvitationMdl> newInvitations = [];
      for (final invitation in response.allInvitations) {
        if (invitation.destination?.id == destinationId) {
          newInvitations.add(invitation);
        }
      }

      invitations.value = RxList.from(newInvitations);
      isLoading.value = false;
    } on DioError catch (e) {
      throw e.toString();
    }
  }
}
