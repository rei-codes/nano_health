import 'package:nano_health/features/home/models/product.dart';
import 'package:nano_health/features/home/services/product_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_provider.g.dart';

@riverpod
Future<List<Product>> products(ProductsRef ref) {
  return ref.watch(productServiceProvider).getProducts();
}

@riverpod
Future<Product> product(ProductRef ref, int id) {
  return ref.watch(productServiceProvider).getProduct(id);
}
