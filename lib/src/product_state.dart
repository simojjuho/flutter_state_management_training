import 'package:flutter/material.dart';
import 'package:state_training/src/core_entities/product.dart';

class ProductState extends ChangeNotifier {
  var products = <Product>[];

  void addProduct(String name, String description, int price) {
    var newProduct = Product(
        id: 1,
        name: name,
        price: price,
        description: description,
        images: ["http://images.com/first-pic"]);
    products.add(newProduct);
    notifyListeners();
  }
}
