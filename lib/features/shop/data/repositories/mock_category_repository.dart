import '../../domain/models/category.dart';
import '../../domain/repositories/category_repository.dart';

class MockCategoryRepository implements CategoryRepository {
  @override
  Future<List<Category>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      const Category(
        id: 'c1',
        name: 'Vegetables',
        itemCount: 45,
        imageUrl: 'https://images.unsplash.com/photo-1566385101042-1a0aa0c1268c?auto=format&fit=crop&q=80&w=400',
      ),
      const Category(
        id: 'c2',
        name: 'Fruits',
        itemCount: 32,
        imageUrl: 'https://images.unsplash.com/photo-1610832958506-aa56368176cf?auto=format&fit=crop&q=80&w=400',
      ),
      const Category(
        id: 'c3',
        name: 'Dairy',
        itemCount: 28,
        imageUrl: 'https://images.unsplash.com/photo-1550583724-b2692b85b150?auto=format&fit=crop&q=80&w=400',
      ),
      const Category(
        id: 'c4',
        name: 'Bakery',
        itemCount: 19,
        imageUrl: 'https://images.unsplash.com/photo-1509440159596-0249088772ff?auto=format&fit=crop&q=80&w=400',
      ),
      const Category(
        id: 'c5',
        name: 'Meat',
        itemCount: 15,
        imageUrl: 'https://images.unsplash.com/photo-1607623814075-e51df1bdc82f?auto=format&fit=crop&q=80&w=400',
      ),
      const Category(
        id: 'c6',
        name: 'Beverages',
        itemCount: 24,
        imageUrl: 'https://images.unsplash.com/photo-1551024709-8f23befc6f87?auto=format&fit=crop&q=80&w=400',
      ),
      const Category(
        id: 'c7',
        name: 'Snacks',
        itemCount: 42,
        imageUrl: 'https://images.unsplash.com/photo-1614735241165-6756e1df61ab?auto=format&fit=crop&q=80&w=400',
      ),
      const Category(
        id: 'c8',
        name: 'Frozen Food',
        itemCount: 12,
        imageUrl: 'https://images.unsplash.com/photo-1547592166-23ac45744acd?auto=format&fit=crop&q=80&w=400',
      ),
    ];
  }
}
