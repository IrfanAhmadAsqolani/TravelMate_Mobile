import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/network/network.dart';

import '../../../models/models.dart';

class InvitationCreateController extends GetxController with CacheManager {
  final isFormLoading = false.obs;

  Future<void> invitationCreate({required InvitationCreateParam param}) async {
    isFormLoading.value = true;
    final user = getUserData();

    try {
      await Api().dio.post(
            'invitations',
            data: param.copyWith(ownerId: user?.id).toMap(),
          );
    } on DioError catch (e) {
      print(e);
      Get.snackbar('Error', 'Failed to create invitation.');
    } catch (e) {
      Get.snackbar('Error', 'Failed to create invitation.');
    }

    isFormLoading.value = false;
  }
}
