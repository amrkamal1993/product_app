import 'package:injectable/injectable.dart';
import '../repositories/product_repository.dart';
import '../entities/product.dart';

@injectable
class GetFavorites {
  final ProductRepository repository;
  GetFavorites(this.repository);

  Future<List<Product>> call() async {
    return await repository.getFavorites();
  }
}
