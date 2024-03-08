import 'package:flutter/material.dart';
import 'package:state_training/src/products/domain/core_entities/category.dart';
import 'package:state_training/src/products/services/category_service.dart';

class CategoryState with ChangeNotifier {
  CategoryState() {
    setProducts();
  }

  final service = CategoryService();
  var categories = <Category>[];

  void setProducts() async {
    categories = await service.getAll();
  }
}
