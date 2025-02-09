import '../entities/product.dart';

abstract class ProductRepository {
  Future<List<Product>> getProducts();
  Future<void> toggleFavorite(Product product);
  Future<List<Product>> getFavorites();
}
