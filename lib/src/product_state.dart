import 'package:flutter/material.dart';
import 'package:state_training/src/controllers/product_controller.dart';
import 'package:state_training/src/core_entities/product.dart';
import 'package:state_training/src/core_entities/product_create_dto.dart';

class ProductState extends ChangeNotifier {
  var products = <Product>[];
  final controller = ProductController();

  void setProducts() async {
    products = await controller.getProducts();
    notifyListeners();
  }

  Future<List<Product>> getProducts() async {
    products = await controller.getProducts();
    return products;
  }

  void addProduct(String title, String description, int price) {
    var newProduct = ProductCreateDto(
        title: title,
        price: price,
        description: description,
        images: ["http://images.com/first-pic"]);
    print(newProduct);
    notifyListeners();
  }
}
