import 'package:flutter/material.dart';

import '../../domain/core_entities/user.dart';
import '../../domain/enums/roles.dart';

class UserState extends ChangeNotifier {
  User? loggedUser;

  void logInUser(User user) {
    loggedUser = user;
    notifyListeners();
  }

  void logOutUser() {
    loggedUser = null;
    notifyListeners();
  }

  bool isLoggedIn() {
    return loggedUser != null;
  }

  bool isAdmin() {
    return isLoggedIn() && loggedUser!.role == Roles.admin;
  }
}
