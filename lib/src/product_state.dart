import 'package:dio/dio.dart';
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
  Future<bool> getProducts() async {
    products = await controller.getProducts();
    return true;
  }

  void addProduct(Product product) {
    products.add(product);
    notifyListeners();
  }

  void removeProduct(int id) async {
    await controller.deleteProduct(id);
    products = products.where((element) => element.id != id).toList();
    notifyListeners();
  }
}
