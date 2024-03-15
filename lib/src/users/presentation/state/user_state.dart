import 'package:flutter/material.dart';

import '../../domain/core_entities/user.dart';
import '../../domain/enums/roles.dart';

class UserState extends ChangeNotifier {
  User? loggedUser;
  bool isAdmin = false;

  void logInUser(User user) {
    loggedUser = user;
    isAdmin = loggedUser!.role == Roles.admin ? true : false;
    notifyListeners();
  }

  void logOutUser() {
    loggedUser = null;
    isAdmin = false;
    notifyListeners();
  }

  bool isLoggedIn() {
    return loggedUser != null;
  }
}
