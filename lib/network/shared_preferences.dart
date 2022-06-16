import '../dependencies/dependencies.dart';

class SharedPref {
  //key
  static const String _userToken = '_userToken';

  static Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  static Future<String?> getUserToken() async =>
      (await prefs).getString(_userToken);

  static Future<void> setUserToken(String value) async =>
      (await prefs).setString(_userToken, value);

  static Future clearUserToken() async {
    (await prefs).remove(_userToken);
  }
}
