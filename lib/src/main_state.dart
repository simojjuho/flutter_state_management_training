import 'package:flutter/material.dart';
import 'package:state_training/src/core_entities/product.dart';

class MainState extends ChangeNotifier {
  var products = <Product>[];

  void addProduct(Product value) {
    products.add(value);
  }
}
