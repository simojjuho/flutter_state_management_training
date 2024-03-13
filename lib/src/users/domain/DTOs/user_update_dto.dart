import 'dart:convert';

import 'package:state_training/src/users/domain/enums/roles.dart';

class UserUpdateDto {
  final String? email;
  final String? name;
  final Roles? role;
  final String? password;
  final String? avatar;

  UserUpdateDto({
    this.email,
    this.name,
    this.role,
    this.password,
    this.avatar,
  });

  String convertToJson() {
    Map<String, dynamic> data = {};
    if (email != null) {
      data['email'] = email;
    }
    if (name != null) {
      data['name'] = name;
    }
    if (role != null) {
      data['role'] = role;
    }
    if (password != null) {
      data['password'] = password;
    }
    if (avatar != null) {
      data['avatar'] = avatar;
    }

    return jsonEncode(data);
  }
}
