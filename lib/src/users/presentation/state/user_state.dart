import 'package:flutter/material.dart';

import '../../domain/core_entities/user.dart';

class UserState extends ChangeNotifier {
  User? loggedUser;

  logInUser(User user) {
    loggedUser = user;
    notifyListeners();
  }

  logOutUser() {
    loggedUser = null;
    notifyListeners();
  }
}
