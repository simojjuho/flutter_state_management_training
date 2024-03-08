import 'package:state_training/src/products/domain/core_entities/category.dart';

class Product {
  final int id;
  final String title;
  final int price;
  final String description;
  final List<String> images;
  final Category category;
  final DateTime creationAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.category,
    required this.creationAt,
    required this.updatedAt,
  });

  static Product parseProduct(productData) {
    return Product(
        id: productData['id'],
        title: productData['title'],
        price: productData['price'],
        description: productData['description'],
        images: List<String>.from(productData['images']),
        category: Category.parseCategory(productData['category']),
        creationAt: DateTime.parse(productData['creationAt']),
        updatedAt: DateTime.parse(productData['updatedAt']));
  }
}
