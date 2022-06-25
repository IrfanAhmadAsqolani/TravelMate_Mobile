import 'package:travelmate/network/network.dart';

import '../dependencies/dependencies.dart';
import '../features/login/pages/login_page.dart';
import '../models/models.dart';

class AuthHelper with CacheManager {
  Future<void> getMyUserDataAndSaveToLocal() async {
    try {
      final res = await Api().dio.get('users/me');
      if (res.data != null) {
        final response = res.data as Map<String, dynamic>;

        final userData = UserMdl.fromMap(response);
        await saveUserData(userData);
      } else {
        Get.offNamedUntil(loginPageRoute, (route) => false);
        throw '';
      }
    } on DioError catch (_) {
      Get.snackbar('Error', 'Failed to fetch information');
    } catch (_) {
      Get.snackbar('Error', 'Failed to fetch information');
    }
  }
}
