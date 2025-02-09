import 'package:injectable/injectable.dart';

import '../repositories/product_repository.dart';
import '../entities/product.dart';

@injectable
class GetProducts {
  final ProductRepository repository;
  GetProducts(this.repository);

  Future<List<Product>> call() async {
    return await repository.getProducts();
  }
}
