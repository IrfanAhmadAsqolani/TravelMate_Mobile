import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/features/login/pages/login_page.dart';
import 'package:travelmate/features/main_page/main_page.dart';
import 'package:travelmate/network/network.dart';

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
  }

  void login(String? token) async {
    isLogged.value = true;
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    Future.delayed(const Duration(milliseconds: 500)).then((_) {
      if (token != null) {
        Get.offNamedUntil(mainPageRoute, (route) => false);
      } else {
        Get.offNamedUntil(loginPageRoute, (route) => false);
      }
    });
  }

  Future<void> signIn({
    required String username,
    required String password,
  }) async {
    isLoginLoading.value = true;
    try {
      final res = await Api().dio.post(
        'login',
        data: {
          'username': username,
          'password': password,
        },
      );
      if (res.data != null) {
        final response = res.data as Map<String, dynamic>;
        saveToken(response['token']);
        Get.offNamedUntil(mainPageRoute, (route) => false);
      } else {
        throw '';
      }
    } on DioError catch (e) {
      Get.snackbar('Error', 'Gagal login');
    } catch (e) {
      Get.snackbar('Error', 'Gagal login');
    }

    isLoginLoading.value = false;
  }

  void signOut() {
    logOut();
    Get.offNamedUntil(loginPageRoute, (route) => false);
  }
}
