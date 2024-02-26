import 'package:flutter/material.dart';
import 'package:state_training/src/core_entities/product.dart';

class ProductState extends ChangeNotifier {
  var products = <String>[];

  void addProduct(String value) {
    products.add(value);
    notifyListeners();
  }
}
