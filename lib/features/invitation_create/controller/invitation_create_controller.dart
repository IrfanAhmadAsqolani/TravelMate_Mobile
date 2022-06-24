import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/login/pages/login_page.dart';
import 'package:travelmate/features/main_page/main_page.dart';
import 'package:travelmate/features/onboarding/pages/onboarding_page.dart';
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
      Get.snackbar('Error', 'Gagal register');
    } catch (e) {
      Get.snackbar('Error', 'Gagal register');
    }

    isFormLoading.value = false;
  }
}
