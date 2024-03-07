import 'package:flutter/material.dart';
import 'package:state_training/src/core_entities/product.dart';
import 'package:state_training/src/services/product_service.dart';

class ProductState with ChangeNotifier {
  ProductState() {
    setProducts();
  }

  var products = <Product>[];
  final service = ProductService();

  void setProducts() async {
    products = await service.getProducts();
    notifyListeners();
  }

  void addProduct(Product product) {
    products.add(product);
    notifyListeners();
  }

  void removeProduct(int id) async {
    await service.deleteProduct(id);
    products = products.where((element) => element.id != id).toList();
    notifyListeners();
  }
}
