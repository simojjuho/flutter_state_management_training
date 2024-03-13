import 'package:state_training/src/users/domain/DTOs/user_create_dto.dart';
import 'package:state_training/src/users/domain/DTOs/user_update_dto.dart';
import 'package:state_training/src/users/domain/core_entities/user.dart';

import '../controllers/user_controller.dart';
import '../domain/enums/roles.dart';

class UserService {
  const UserService({
    required this.controller,
  });

  final UserController controller;

  Future<User> getUser(int id) async {
    final user = await controller.getUser(id);
    return user;
  }

  Future<List<User>> getUsers() async {
    final users = await controller.getAllUsers();
    return users;
  }

  Future<User> createUser(
    String email,
    String password,
    String name,
    String avatar,
  ) async {
    final userDto = UserCreateDto(
      email: email,
      name: name,
      password: password,
      avatar: avatar,
    );

    final newUser = await controller.createUser(userDto);
    return newUser;
  }

  Future<User> updateUser(
    int id,
    String? email,
    String? password,
    String? name,
    String? avatar,
    Roles? role,
  ) async {
    final userDto = UserUpdateDto(
      email: email,
      password: password,
      name: name,
      avatar: avatar,
      role: role,
    );

    final updatedUser = await controller.updateUser(userDto, id);
    return updatedUser;
  }

  Future<bool> removeUser(int id) async {
    final response = await controller.removeUser(id);
    return response;
  }
}
