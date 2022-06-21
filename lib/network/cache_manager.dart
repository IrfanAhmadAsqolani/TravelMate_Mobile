// ignore_for_file: constant_identifier_names

import '../dependencies/dependencies.dart';
import '../models/models.dart';

mixin CacheManager {
  Future<bool> saveToken(String? token) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  String? getToken() {
    final box = GetStorage();
    return box.read(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.TOKEN.toString());
  }

  Future<bool> saveUserData(UserMdl? user) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.USERDATA.toString(), user?.toMap());
    return true;
  }

  UserMdl? getUserData() {
    final box = GetStorage();
    return UserMdl.fromMap(box.read(CacheManagerKey.USERDATA.toString()));
  }

  Future<void> removeUserData() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.USERDATA.toString());
  }
}

enum CacheManagerKey { TOKEN, USERDATA }
