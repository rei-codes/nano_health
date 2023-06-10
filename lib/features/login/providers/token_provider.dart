import 'package:nano_health/core/services/storage_service.dart';
import 'package:nano_health/features/login/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/login_request.dart';

part 'token_provider.g.dart';

@riverpod
class Token extends _$Token {
  StorageService get _storage => ref.watch(storageServiceProvider);

  @override
  String? build() => _storage.getToken();

  Future<void> login(LoginRequest model) async {
    final token = await ref.watch(authServiceProvider).login(model);
    _storage.setToken(token);
  }

  void logout() {
    _storage.clear();
    ref.invalidateSelf();
  }
}
