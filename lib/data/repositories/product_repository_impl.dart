import 'package:injectable/injectable.dart';
import 'package:product_app/data/models/product.dart';
import 'package:product_app/domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../../data/sources/product_remote_data_source.dart';
import '../../data/sources/product_local_data_source.dart';

@LazySingleton(as: ProductRepository)
class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<List<Product>> getProducts() async {
    final products = await remoteDataSource.getProducts();
    return products.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> toggleFavorite(Product product) async {
    final favorites = await localDataSource.getFavorites();
    final favoriteModels = favorites.map((model) => model.toEntity()).toList();

    if (favoriteModels.any((p) => p.id == product.id)) {
      favoriteModels.removeWhere((p) => p.id == product.id);
    } else {
      favoriteModels.add(product);
    }

    await localDataSource.cacheFavorites(
      favoriteModels.map((entity) => ProductModel.fromEntity(entity)).toList(),
    );
  }

  @override
  Future<List<Product>> getFavorites() async {
    final favorites = await localDataSource.getFavorites();
    return favorites.map((model) => model.toEntity()).toList();
  }
}
