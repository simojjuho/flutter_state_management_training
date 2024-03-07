import 'package:flutter/material.dart';

class MainViewState with ChangeNotifier {
  int selectedIndex = 0;

  void setIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
