import 'dart:convert';

class ProductCreateDto {
  final String title;
  final int price;
  final String description;
  final List<String> images;
  final int categoryId;

  ProductCreateDto({
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.categoryId,
  });

  String convertToJson() {
    final Map<String, dynamic> data = {
      'title': title,
      'price': price,
      'description': description,
      'images': images,
      'categoryId': categoryId
    };
    return jsonEncode(data);
  }
}
