import 'package:dio/dio.dart';

import '../models/login_request.dart';

abstract base class BaseAuthService {
  const BaseAuthService(this.dio);
  final Dio dio;

  Future<String> login(LoginRequest model);
}
