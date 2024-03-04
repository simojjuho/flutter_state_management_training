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

  //This is for FutureBuilder in product view, which needs a return value.
  //I will have to see, if setProducts() is needed at all, but it stays for now.
  Future<List<Product>> getProducts() async {
    products = await controller.getProducts();
    return products;
  }

  void addProduct(String title, String description, int price) async {
    var newProduct = ProductCreateDto(
        title: title,
        price: price,
        description: description,
        images: ["http://images.com/first-pic"]);
    var product = await controller.addNewProduct(newProduct);
    products.add(product);
    notifyListeners();
  }
}
