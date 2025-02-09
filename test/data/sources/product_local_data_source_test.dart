import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:hive/hive.dart';
import 'package:product_app/data/sources/product_local_data_source.dart';
import 'package:product_app/data/models/product.dart';

import 'product_local_data_source_test.mocks.dart';

@GenerateNiceMocks([MockSpec<Box>()])
void main() {
  late MockBox mockBox;
  late ProductLocalDataSourceImpl localDataSource;

  setUp(() {
    mockBox = MockBox();
    localDataSource = ProductLocalDataSourceImpl(mockBox);
  });

  group('Local Data Source - Hive Storage', () {
    test('should cache favorite products', () async {
      // Arrange
      final testProducts = [
        ProductModel(id: 1, title: "Test Product", price: 10.0, category: "Test", description: "Test desc", image: "test.jpg"),
      ];
      final jsonList = testProducts.map((p) => p.toJson()).toList();

      when(mockBox.put('favorites', jsonList)).thenAnswer((_) async => Future.value());

      // Act
      await localDataSource.cacheFavorites(testProducts);

      // Assert
      verify(mockBox.put('favorites', jsonList)).called(1);
    });

    test('should retrieve favorite products', () async {
      // Arrange
      final jsonList = [
        {"id": 1, "title": "Test Product", "price": 10.0, "category": "Test", "description": "Test desc", "image": "test.jpg"}
      ];

      when(mockBox.get('favorites')).thenReturn(jsonList);

      // Act
      final result = await localDataSource.getFavorites();

      // Assert
      expect(result, isA<List<ProductModel>>());
      expect(result.first.id, 1);
    });

    test('should return an empty list if no favorites are stored', () async {
      // Arrange
      when(mockBox.get('favorites')).thenReturn(null);

      // Act
      final result = await localDataSource.getFavorites();

      // Assert
      expect(result, isEmpty);
    });
  });
}
