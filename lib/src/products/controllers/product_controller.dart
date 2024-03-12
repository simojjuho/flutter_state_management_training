import 'package:dio/dio.dart';
import 'package:state_training/src/products/domain/core_entities/product.dart';
import 'package:state_training/src/products/domain/DTOs/product_create_dto.dart';
import 'package:state_training/src/products/domain/DTOs/product_update_dto.dart';
import 'package:state_training/src/utils/http.dart';

class ProductController {
  final urlExtension = '/products';
  Future<List<Product>> getProducts() async {
    try {
      var response = await dio.get(urlExtension);
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
      var response = await dio.get('$urlExtension/$id');
      final dynamic rawData = response.data;
      return Product.parseProduct(rawData);
    } on DioException {
      rethrow;
    }
  }

  Future<Product> addNewProduct(ProductCreateDto productDto) async {
    try {
      var response = await dio.post(
        urlExtension,
        data: productDto.convertToJson(),
        options: Options(contentType: Headers.jsonContentType),
      );
      final dynamic rawData = response.data;
      return Product.parseProduct(rawData);
    } on DioException {
      rethrow;
    }
  }

  Future<Product> updateProduct(ProductUpdateDto productNewVals, int id) async {
    try {
      var response = await dio.put(
        '$urlExtension/$id',
        data: productNewVals.convertToJson(),
        options: Options(contentType: Headers.jsonContentType),
      );
      final dynamic rawData = response.data;
      return Product.parseProduct(rawData);
    } on DioException {
      rethrow;
    }
  }

  Future<bool> deleteProduct(int productId) async {
    await dio.delete('$urlExtension/$productId');
    return true;
  }
}
