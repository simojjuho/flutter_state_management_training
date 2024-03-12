import 'package:flutter/material.dart';
import 'package:state_training/src/products/domain/core_entities/category.dart';
import 'package:state_training/src/products/services/category_service.dart';

class CategoryState with ChangeNotifier {
  CategoryState() {
    setCategories();
  }

  final service = CategoryService();
  var categories = <Category>[];
  var categoryNames = <String>[];
  var selectedCategory = "";

  void setCategories() async {
    categories = await service.getAll();
    setCategoryNames();
    notifyListeners();
  }

  void setCategoryNames() {
    categoryNames = categories.map((e) => e.name).toList();
    categoryNames.add('Show all');
    setSelectedCategory(categoryNames[0]);
  }

  void setSelectedCategory(String value) {
    selectedCategory = value;
    notifyListeners();
  }
}
