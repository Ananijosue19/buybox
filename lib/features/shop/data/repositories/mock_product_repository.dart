import '../../domain/models/product.dart';
import '../../domain/repositories/product_repository.dart';

class MockProductRepository implements ProductRepository {
  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      const Product(
        id: '1',
        name: 'Fresh Red Tomatoes',
        price: 4.45,
        rating: 4.8,
        reviewCount: 243,
        imageUrl: 'https://images.unsplash.com/photo-1592924357228-91a4daadcfea?auto=format&fit=crop&q=80&w=1000',
      ),
      const Product(
        id: '2',
        name: 'Organic Bananas',
        price: 2.99,
        rating: 4.5,
        reviewCount: 156,
        imageUrl: 'https://images.unsplash.com/photo-1668762924684-a9753a0a887c?auto=format&fit=crop&q=80&w=1000',
      ),
      const Product(
        id: '3',
        name: 'Whole Grain Bread',
        price: 3.50,
        rating: 4.7,
        reviewCount: 89,
        imageUrl: 'https://images.unsplash.com/photo-1549931319-a545dcf3bc73?auto=format&fit=crop&q=80&w=1000',
      ),
      const Product(
        id: '4',
        name: 'Fresh Avocado',
        price: 5.20,
        rating: 4.9,
        reviewCount: 312,
        imageUrl: 'https://images.unsplash.com/photo-1523049673857-eb18f1d7b578?auto=format&fit=crop&q=80&w=1000',
      ),
      const Product(
        id: '5',
        name: 'Full Cream Milk',
        price: 1.80,
        rating: 4.4,
        reviewCount: 567,
        imageUrl: 'https://images.unsplash.com/photo-1553301803-768cd4a59b9c?auto=format&fit=crop&q=80&w=1000',
      ),
      const Product(
        id: '6',
        name: 'Green Bell Peppers',
        price: 2.10,
        rating: 4.6,
        reviewCount: 124,
        imageUrl: 'https://images.unsplash.com/photo-1566842600175-97dca489844f?auto=format&fit=crop&q=80&w=1000',
      ),
      const Product(
        id: '7',
        name: 'Fresh Orange Juice',
        price: 3.40,
        rating: 4.7,
        reviewCount: 89,
        imageUrl: 'https://images.unsplash.com/photo-1613478223719-2ab802602423?auto=format&fit=crop&q=80&w=1000',
      ),
      const Product(
        id: '8',
        name: 'Mixed Nuts',
        price: 7.50,
        rating: 4.5,
        reviewCount: 210,
        imageUrl: 'https://images.unsplash.com/photo-1511067007398-7e4b90cfa4bc?auto=format&fit=crop&q=80&w=1000',
      ),
    ];
  }

  @override
  Future<List<Product>> getRecommendedProducts() async {
    return getProducts();
  }

  @override
  Future<Product> getProductById(String id) async {
    final products = await getProducts();
    return products.firstWhere((p) => p.id == id);
  }
}
