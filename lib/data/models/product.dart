import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:product_app/domain/entities/product.dart';

part 'product.g.dart';

List<ProductModel> productModelFromJson(String str) =>
    List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

@HiveType(typeId: 0)
class ProductModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String image;

  @HiveField(3)
  final double price;

  @HiveField(4)
  final String description;

  @HiveField(5)
  final String category;

  ProductModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.description,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    price: json["price"].toDouble(),
    description: json["description"],
    category: json["category"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "price": price,
    "description": description,
    "category": category,
  };

  // Convert ProductModel to Product entity
  Product toEntity() => Product(
    id: id,
    title: title,
    image: image,
    price: price,
    description: description,
    category: category,
  );

  // Convert Product entity to ProductModel
  static ProductModel fromEntity(Product entity) => ProductModel(
    id: entity.id,
    title: entity.title,
    image: entity.image,
    price: entity.price,
    description: entity.description,
    category: entity.category,
  );
}