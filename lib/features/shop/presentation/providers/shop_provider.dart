import 'package:flutter/material.dart';
import '../../domain/models/category.dart';
import '../../domain/models/product.dart';
import '../../domain/repositories/category_repository.dart';
import '../../domain/repositories/product_repository.dart';

class ShopProvider with ChangeNotifier {
  final ProductRepository productRepository;
  final CategoryRepository categoryRepository;

  ShopProvider({
    required this.productRepository,
    required this.categoryRepository,
  });

  List<Product> _products = [];
  List<Category> _categories = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  List<Category> get categories => _categories;
  bool get isLoading => _isLoading;

  Future<void> loadShopData() async {
    _isLoading = true;
    notifyListeners();

    try {
      final results = await Future.wait([
        productRepository.getProducts(),
        categoryRepository.getCategories(),
      ]);
      _products = results[0] as List<Product>;
      _categories = results[1] as List<Category>;
    } catch (e) {
      debugPrint('Error loading shop data: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void toggleFavorite(String productId) {
    final index = _products.indexWhere((p) => p.id == productId);
    if (index >= 0) {
      _products[index] = _products[index].toggleFavorite();
      notifyListeners();
    }
  }
  
  void updateProductQuantity(String productId, int newQuantity) {
    final index = _products.indexWhere((p) => p.id == productId);
    if (index >= 0) {
      _products[index] = _products[index].copyWith(quantity: newQuantity);
      notifyListeners();
    }
  }
}
