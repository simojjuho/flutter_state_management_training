import 'package:state_training/src/users/domain/enums/roles.dart';

class User {
  final int id;
  final String email;
  final String name;
  final Roles role;
  final String password;
  final String avatar;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.role,
    required this.password,
    required this.avatar,
  });

  static User parseUser(userData) {
    return User(
        id: userData['id'],
        email: userData['email'],
        name: userData['name'],
        role: userData['role'],
        password: userData['password'],
        avatar: userData['avatar']);
  }
}
