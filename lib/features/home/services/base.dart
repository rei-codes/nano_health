import 'package:dio/dio.dart';

import '../models/product.dart';

abstract base class BaseProductService {
  const BaseProductService(this.dio);
  final Dio dio;

  Future<List<Product>> getProducts();
  Future<Product> getProduct(int id);
}
