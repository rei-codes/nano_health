import 'package:nano_health/core/services/dio_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/product.dart';
import 'base.dart';

part 'product_service.g.dart';

@Riverpod(keepAlive: true)
ProductService productService(ProductServiceRef ref) {
  return ProductService(ref.watch(dioServiceProvider));
}

final class ProductService extends BaseProductService {
  const ProductService(super.dio);

  @override
  Future<List<Product>> getProducts() async {
    final res = await dio.get('products');
    final list = res.data as List;
    return list.map((e) => Product.fromJson(e)).toList();
  }

  @override
  Future<Product> getProduct(int id) async {
    final res = await dio.get('products/$id');
    return Product.fromJson(res.data);
  }
}
