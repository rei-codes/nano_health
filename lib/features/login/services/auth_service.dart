import 'dart:async';

import 'package:dio/dio.dart';
import 'package:nano_health/core/services/dio_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/login_request.dart';
import 'base.dart';

part 'auth_service.g.dart';

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  return AuthService(ref.watch(dioServiceProvider));
}

final class AuthService extends BaseAuthService {
  const AuthService(super.dio);

  @override
  Future<String> login(LoginRequest model) async {
    try {
      final res = await dio.post('auth/login', data: model.toJson());
      return res.data['token'];
    } catch (e, st) {
      if (e is DioException) {
        throw Error.throwWithStackTrace('Email or password is wrong', st);
      }
      throw Error.throwWithStackTrace('Something went wrong!', st);
    }
  }
}
