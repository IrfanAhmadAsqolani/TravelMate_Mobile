import 'package:travelmate/dependencies/dependencies.dart';
import 'package:travelmate/network/network.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    print("A");
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
    if (token != null) {
      isLogged.value = true;
    }
  }

  Future<void> signIn({
    required String username,
    required String password,
  }) async {
    isLoading.value = true;
    try {
      final response = await Api().dio.post(
        'login',
        data: {
          'username': username,
          'password': password,
        },
      );
      print(response);
    } on DioError catch (e) {
      print(e);
    }

    isLoading.value = false;
  }
}
