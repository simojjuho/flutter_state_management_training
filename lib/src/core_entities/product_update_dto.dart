import 'dart:convert';

class ProductUpdateDto {
  String? title;
  int? price;
  String? description;
  List<String>? images;
  int? categoryId;

  ProductUpdateDto({
    this.title,
    this.price,
    this.description,
    this.images,
    this.categoryId,
  });

  String convertToJson() {
    Map<String, dynamic> data = {};
    if (title != null) {
      data['title'] = title;
    }
    if (price != null) {
      data['price'] = price;
    }
    if (description != null) {
      data['description'] = description;
    }
    if (images != null) {
      data['images'] = images;
    }
    if (categoryId != null) {
      data['categoryId'] = categoryId;
    }

    return jsonEncode(data);
  }
}
