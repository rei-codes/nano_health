import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../providers/product_provider.dart';
import 'product_card.dart';

class ProductList extends ConsumerWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncData = ref.watch(productsProvider);
    return asyncData.map(
      data: (list) {
        if (list.value.isEmpty) {
          return const Center(child: Text('List is empty'));
        }
        return ListView.builder(
          itemCount: list.value.length,
          padding: const EdgeInsets.all(24),
          itemBuilder: (_, i) => ProductCard(list.value[i]),
        );
      },
      error: (_) => const Center(
        child: Text('Something went wrong while loading the data!'),
      ),
      loading: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
