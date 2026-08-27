import 'package:flutter_test/flutter_test.dart';
import 'package:buybox/features/shop/domain/models/product.dart';
import 'package:buybox/features/shop/presentation/providers/cart_provider.dart';

void main() {
  group('CartProvider Tests', () {
    late CartProvider cartProvider;
    const mockProduct = Product(
      id: '1',
      name: 'Test Product',
      price: 10.0,
      rating: 4.0,
      reviewCount: 10,
      imageUrl: 'test.jpg',
    );

    setUp(() {
      cartProvider = CartProvider();
    });

    test('Initial cart should be empty', () {
      expect(cartProvider.items.length, 0);
      expect(cartProvider.totalAmount, 0.0);
    });

    test('Adding a product should increase cart length', () {
      cartProvider.addToCart(mockProduct);
      expect(cartProvider.items.length, 1);
      expect(cartProvider.items.first.quantity, 1);
      expect(cartProvider.totalAmount, 10.0);
    });

    test('Adding same product twice should increase quantity, not length', () {
      cartProvider.addToCart(mockProduct);
      cartProvider.addToCart(mockProduct);
      expect(cartProvider.items.length, 1);
      expect(cartProvider.items.first.quantity, 2);
      expect(cartProvider.totalAmount, 20.0);
    });

    test('Removing a product should empty the cart', () {
      cartProvider.addToCart(mockProduct);
      cartProvider.removeFromCart('1');
      expect(cartProvider.items.length, 0);
    });
  });
}
