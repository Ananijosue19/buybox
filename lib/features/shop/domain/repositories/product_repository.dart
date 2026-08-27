import '../models/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<List<Product>> getRecommendedProducts();
  Future<Product> getProductById(String id);
}
