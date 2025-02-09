import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:product_app/data/models/product.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProducts();
}

@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final http.Client client;

  ProductRemoteDataSourceImpl(this.client);

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await client.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
