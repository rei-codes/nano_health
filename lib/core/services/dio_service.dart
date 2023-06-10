import 'package:dio/dio.dart';
import 'package:nano_health/core/utils/constants.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_service.g.dart';

@Riverpod(keepAlive: true)
Dio dioService(DioServiceRef ref) {
  final options = BaseOptions(baseUrl: Constants.baseUrl);
  return Dio(options);
}
