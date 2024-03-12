import 'package:dio/dio.dart';
import 'package:state_training/src/products/controllers/product_controller.dart';
import 'package:state_training/src/products/domain/DTOs/product_update_dto.dart';
import 'package:state_training/src/products/domain/core_entities/product.dart';
import 'package:state_training/src/products/domain/DTOs/product_create_dto.dart';

class ProductService {
  final controller = ProductController();

  Future<List<Product>> getProducts() async {
    return await controller.getProducts();
  }

  Future<Product> addNewProduct(
    String title,
    int price,
    String description,
    int categoryId,
  ) async {
    try {
      var productCreateDto = ProductCreateDto(
          title: title,
          price: price,
          description: description,
          categoryId: categoryId,
          images: ["http://images.com/first-pic"]);
      var newProduct = await controller.addNewProduct(productCreateDto);
      return newProduct;
    } on DioException {
      rethrow;
    }
  }

  Future<Product> updateProduct(
    int id,
    String title,
    int price,
    String description,
    int categoryId,
  ) async {
    try {
      var productUpdateDto = ProductUpdateDto(
        title: title,
        price: price,
        categoryId: categoryId,
      );
      var updatedProduct = await controller.updateProduct(productUpdateDto, id);
      return updatedProduct;
    } on DioException {
      rethrow;
    }
  }

  Future<bool> deleteProduct(int id) async {
    return await controller.deleteProduct(id);
  }
}
