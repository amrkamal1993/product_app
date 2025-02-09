import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:product_app/data/sources/product_remote_data_source.dart';
import 'package:product_app/data/models/product.dart';

import 'product_remote_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
void main() {
  late MockClient mockHttpClient;
  late ProductRemoteDataSourceImpl remoteDataSource;

  setUp(() {
    mockHttpClient = MockClient();
    remoteDataSource = ProductRemoteDataSourceImpl(mockHttpClient);
  });

  group('Remote Data Source - API Calls', () {
    test('should return a list of products when API call is successful', () async {
      // Arrange
      const mockJsonResponse = '''
      [
        {"id":1,"title":"Test Product","price":10.0,"category":"Test","description":"Test desc","image":"test.jpg"}
      ]''';

      when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response(mockJsonResponse, 200),
      );

      // Act
      final result = await remoteDataSource.getProducts();

      // Assert
      expect(result, isA<List<ProductModel>>());
      expect(result.first.id, 1);
    });

    test('should throw an exception when API call fails', () async {
      // Arrange
      when(mockHttpClient.get(any)).thenAnswer(
            (_) async => http.Response('Error', 500),
      );

      // Act & Assert
      expect(() => remoteDataSource.getProducts(), throwsException);
    });
  });
}
