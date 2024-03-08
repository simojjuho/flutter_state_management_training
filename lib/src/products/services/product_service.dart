import 'package:dio/dio.dart';
import 'package:state_training/src/products/controllers/product_controller.dart';
import 'package:state_training/src/products/domain/core_entities/product.dart';
import 'package:state_training/src/products/domain/DTOs/product_create_dto.dart';

class ProductService {
  final controller = ProductController();

  Future<List<Product>> getProducts() async {
    return await controller.getProducts();
  }

  Future<Product> addNewProduct(
      String title, int price, String description) async {
    try {
      var newProduct = ProductCreateDto(
          title: title,
          price: price,
          description: description,
          categoryId: 1,
          images: ["http://images.com/first-pic"]);
      var product = await controller.addNewProduct(newProduct);
      return product;
    } on DioException {
      rethrow;
    }
  }

  Future<bool> deleteProduct(int id) async {
    return await controller.deleteProduct(id);
  }
}
