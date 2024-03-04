import 'package:state_training/src/core_entities/product_create_dto.dart';

class Product extends ProductCreateDto {
  final int id;
  final DateTime creationAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required super.title,
    required super.price,
    required super.description,
    required super.images,
    required this.creationAt,
    required this.updatedAt,
  });
}
