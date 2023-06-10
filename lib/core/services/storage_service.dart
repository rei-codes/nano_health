import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

part 'storage_service.g.dart';

@Riverpod(keepAlive: true)
StorageService storageService(StorageServiceRef ref) {
  return StorageService();
}

class StorageService {
  late final SharedPreferences instance;

  Future<void> init() async {
    instance = await SharedPreferences.getInstance();
  }

  String? getToken() => instance.getString(Constants.tokenKey);

  void setToken(String value) => instance.setString(Constants.tokenKey, value);

  void clear() => instance.clear();
}
