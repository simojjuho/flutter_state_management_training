import 'package:flutter/material.dart';
import 'package:state_training/src/products/domain/core_entities/product.dart';

class UserState extends ChangeNotifier {
  var users = <Product>[];

  void addUser(Product value) {
    users.add(value);
  }
}
