import 'package:pincode/service/local_storage_service.dart';

class PasswordRepository {
  LocalStorageService service = LocalStorageService();
  static String key = 'password';

  Future<void> setPassword(String password) async {
    await service.saveString(key, password);
  }

  Future<String?> getPassword() async {
    return service.getString(key);
  }
}
