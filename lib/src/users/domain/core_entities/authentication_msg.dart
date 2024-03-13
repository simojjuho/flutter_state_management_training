import 'dart:convert';

class AuthenticationMsg {
  final String email;
  final String password;

  AuthenticationMsg({
    required this.email,
    required this.password,
  });

  String convertToJson() {
    Map<String, dynamic> data = {};
    data['email'] = email;
    data['password'] = password;

    return jsonEncode(data);
  }
}
