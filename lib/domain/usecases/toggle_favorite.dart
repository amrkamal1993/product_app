import 'package:injectable/injectable.dart';

import '../repositories/product_repository.dart';
import '../entities/product.dart';

@injectable
class ToggleFavorite {
  final ProductRepository repository;
  ToggleFavorite(this.repository);

  Future<void> call(Product product) async {
    await repository.toggleFavorite(product);
  }
}
