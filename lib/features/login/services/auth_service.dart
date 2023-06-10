import 'dart:async';

import 'package:dio/dio.dart';
import 'package:nano_health/core/services/dio_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/login_request.dart';

part 'auth_service.g.dart';

abstract interface class IAuthService {
  const IAuthService(this.dio);
  final Dio dio;

  Future<String> login(LoginRequest model);
}

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  return AuthService(ref.watch(dioServiceProvider));
}

class AuthService extends IAuthService {
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
