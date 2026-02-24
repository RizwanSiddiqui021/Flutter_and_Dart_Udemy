import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/models/product.dart';

class CartProviderNotifier extends Notifier<Set<Product>> {
  @override
  Set<Product> build() {
    return {
      const Product(
        id: '4',
        title: 'Red Backpack',
        price: 14,
        image: 'assets/products/backpack.png',
      ),
    };
  }

  // Add your methods here later (add/remove/update)
  void addProduct(Product product) {
    if (!state.contains(product)) {
      state = {...state, product};
    }
  }

  void removeProduct(Product product) {
    if (state.contains(product)) {
      state = state.where((p) => p.id != product.id).toSet();
    }
  }
}

// PROVIDER — must be outside the class
final cartNotifierProvider =
    NotifierProvider<CartProviderNotifier, Set<Product>>(() {
  return CartProviderNotifier();
});

final cartTotalProvider = Provider<int>((ref) {
  final cartProducts = ref.watch(cartNotifierProvider);

  int total = 0;
  for (final product in cartProducts) {
    total += product.price;
  }

  return total;
});
