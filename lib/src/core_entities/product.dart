import 'package:state_training/src/core_entities/product_create_dto.dart';

class Product extends ProductCreateDto {
  final int id;
  final DateTime creationAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required String title,
    required int price,
    required String description,
    required List<String> images,
    required this.creationAt,
    required this.updatedAt,
  }) : super(
          title: title,
          price: price,
          description: description,
          images: images,
        );
}
