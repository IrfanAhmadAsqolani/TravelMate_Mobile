import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/login/pages/login_page.dart';
import 'package:travelmate/features/main_page/main_page.dart';
import 'package:travelmate/features/onboarding/pages/onboarding_page.dart';
import 'package:travelmate/network/network.dart';

import '../models/models.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;
  final isLoginLoading = false.obs;
  final isRegisterLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  void logOut() {
    isLogged.value = false;
    removeToken();
    removeUserData();
    Get.offNamedUntil(loginPageRoute, (route) => false);
  }

  void login(String? token) async {
    isLogged.value = true;
    await saveToken(token);
  }

  Future<void> checkLoginStatus() async {
    final token = getToken();
    Future.delayed(const Duration(milliseconds: 500)).then((_) async {
      if (token != null) {
        await getMyDetailFromNetworkAndSaveToLocal();
        Get.offNamedUntil(mainPageRoute, (route) => false);
      } else {
        Get.offNamedUntil(loginPageRoute, (route) => false);
      }
    });
  }

  Future<void> signIn({
    required LoginParam param,
  }) async {
    isLoginLoading.value = true;
    try {
      final res = await Api().dio.post(
            'login',
            data: param.toMap(),
          );
      if (res.data != null) {
        final response = res.data as Map<String, dynamic>;
        await saveTokenAndGetDetailFromNetworkAndSaveToLocal(response['token']);
        Get.offNamedUntil(mainPageRoute, (route) => false);
      } else {
        throw '';
      }
    } on DioError catch (_) {
      Get.snackbar('Error', 'Gagal login');
    } catch (e) {
      Get.snackbar('Error', 'Gagal login');
    }

    isLoginLoading.value = false;
  }

  Future<void> register({required RegisterParam param}) async {
    isRegisterLoading.value = true;
    try {
      final res = await Api().dio.post(
            'users',
            data: param.toMap(),
          );
      if (res.data != null) {
        final response = res.data as Map<String, dynamic>;
        await saveTokenAndGetDetailFromNetworkAndSaveToLocal(response['token']);
        Get.offNamedUntil(onboardingPageRoute, (route) => false);
      } else {
        throw '';
      }
    } on DioError catch (e) {
      Get.snackbar('Error', 'Failed to register.');
    } catch (e) {
      Get.snackbar('Error', 'Failed to register.');
    }

    isRegisterLoading.value = false;
  }

  Future<void> getMyDetailFromNetworkAndSaveToLocal() async {
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

  Future<void> saveTokenAndGetDetailFromNetworkAndSaveToLocal(
      String token) async {
    await saveToken(token);
    await getMyDetailFromNetworkAndSaveToLocal();
  }

  Future<UserMdl?> getMyUserData() async {
    return getUserData();
  }

  void signOut() {
    logOut();
    Get.offNamedUntil(loginPageRoute, (route) => false);
  }
}
