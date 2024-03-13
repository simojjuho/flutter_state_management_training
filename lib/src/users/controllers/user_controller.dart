import 'package:dio/dio.dart';

import '/src/utils/http.dart';
import '../domain/core_entities/user.dart';
import '../domain/DTOs/user_create_dto.dart';
import '../domain/DTOs/user_update_dto.dart';

class UserController {
  final urlExtension = '/users';

  Future<User> getUser(int id) async {
    final response = await dio.get('$urlExtension/$id');
    final user = User.parseUser(response.data);
    return user;
  }

  Future<List<User>> getAllUsers() async {
    final response = await dio.get(urlExtension);
    final rawData = response.data;
    List<User> users =
        rawData.map<User>((userData) => User.parseUser(userData));
    return users;
  }

  Future<User> createUser(UserCreateDto userDto) async {
    final response = await dio.post(
      urlExtension,
      data: userDto.convertToJson(),
      options: Options(contentType: Headers.jsonContentType),
    );
    final rawData = response.data;
    return User.parseUser(rawData);
  }

  Future<User> updateUser(UserUpdateDto userDto, int id) async {
    final response = await dio.put(
      '$urlExtension/$id',
      data: userDto.convertToJson(),
      options: Options(contentType: Headers.jsonContentType),
    );
    final rawData = response.data;
    return User.parseUser(rawData);
  }

  Future<bool> removeUser(int id) async {
    await dio.delete('$urlExtension/$id');
    return true;
  }
}
