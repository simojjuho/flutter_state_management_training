import 'package:dio/dio.dart';
import 'package:state_training/src/core_entities/product.dart';

class ProductController {
  final dio = Dio();
  final baseUrl = "https://api.escuelajs.co/api/v1/products";

  Future<List<Product>> getProducts() async {
    try {
      var result = await dio.get(baseUrl);
      final List<dynamic> rawData = result.data;
      final List<Product> products = rawData.map((productData) {
        return Product(
            id: productData['id'],
            title: productData['title'],
            price: productData['price'],
            description: productData['description'],
            images: List<String>.from(productData['images']),
            creationAt: DateTime.parse(productData['creationAt']),
            updatedAt: DateTime.parse(productData['updatedAt']));
      }).toList();
      return products;
    } on DioException catch (_) {
      print('Error block');
      return [];
    }
  }
}
