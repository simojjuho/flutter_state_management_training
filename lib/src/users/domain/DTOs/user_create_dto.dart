import 'dart:convert';

class UserCreateDto {
  final String email;
  final String name;
  final String password;
  final String avatar;

  UserCreateDto({
    required this.email,
    required this.name,
    required this.password,
    required this.avatar,
  });

  String convertToJson() {
    final Map<String, dynamic> data = {
      'email': email,
      'name': name,
      'password': password,
      'avatar': avatar,
    };
    return jsonEncode(data);
  }
}
