import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:product_app/data/models/product.dart';

abstract class ProductLocalDataSource {
  Future<void> cacheFavorites(List<ProductModel> products);
  Future<List<ProductModel>> getFavorites();
}

@LazySingleton(as: ProductLocalDataSource)
class ProductLocalDataSourceImpl implements ProductLocalDataSource {
   Box<dynamic> box;

  ProductLocalDataSourceImpl(this.box);

  @override
  Future<void> cacheFavorites(List<ProductModel> products) async {
    final jsonList = products.map((p) => p.toJson()).toList();
    await box.put('favorites', jsonList);
  }

  @override
  Future<List<ProductModel>> getFavorites() async {
    final jsonList = box.get('favorites');
    if (jsonList != null) {
      return (jsonList as List).map((e) => ProductModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
