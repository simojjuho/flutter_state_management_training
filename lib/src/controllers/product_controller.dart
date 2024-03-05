import 'package:dio/dio.dart';
import 'package:state_training/src/core_entities/product.dart';
import 'package:state_training/src/core_entities/product_create_dto.dart';
import 'package:state_training/src/core_entities/product_update_dto.dart';

class ProductController {
  final dio = Dio();
  final baseUrl = "https://api.escuelajs.co/api/v1/products";

  Future<List<Product>> getProducts() async {
    try {
      var response = await dio.get(baseUrl);
      final List<dynamic> rawData = response.data;
      final List<Product> products = rawData
          .map((productData) => Product.parseProduct(productData))
          .toList();
      return products;
    } on DioException catch (e) {
      throw Exception("Something happened: ${e.message}");
    }
  }

  Future<Product> getProduct(String id) async {
    try {
      var response = await dio.get('$baseUrl/$id');
      final dynamic rawData = response.data;
      return Product.parseProduct(rawData);
    } catch (e) {
      throw Exception("Product with such an id ($id) does not exist!");
    }
  }

  Future<Product> addNewProduct(ProductCreateDto productDto) async {
    try {
      var response = await dio.post(
        baseUrl,
        data: productDto.convertToJson(),
        options: Options(contentType: Headers.jsonContentType),
      );
      final dynamic rawData = response.data;
      return Product.parseProduct(rawData);
    } on DioException catch (e) {
      throw Exception('Something happened: ${e.message}');
    }
  }

  Future<Product> updateProduct(ProductUpdateDto productNewVals, int id) async {
    try {
      var response = await dio.put(
        '$baseUrl/$id',
        data: productNewVals.convertToJson(),
        options: Options(contentType: Headers.jsonContentType),
      );
      final dynamic rawData = response.data;
      return Product.parseProduct(rawData);
    } on DioException catch (e) {
      throw Exception('Something happened: ${e.message}');
    }
  }
}
