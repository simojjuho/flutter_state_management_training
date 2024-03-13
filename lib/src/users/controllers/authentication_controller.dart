import 'package:dio/dio.dart';

import '../domain/core_entities/authentication_msg.dart';
import '../domain/core_entities/authentication_response.dart';
import '../domain/core_entities/user.dart';
import '/src/utils/http.dart';

class AuthenticationController {
  Future<AuthenticationResponse> authenticate(AuthenticationMsg authMsg) async {
    final response = await dio.post(
      '/auth/login/',
      data: authMsg.convertToJson(),
      options: Options(contentType: Headers.jsonContentType),
    );
    var rawData = response.data;
    return AuthenticationResponse.parse(rawData);
  }

  Future<User> getProfile(String token) async {
    final response = await dio.post('/profile',
        options: Options(headers: {'Authorization': 'Bearer $token'}));
    final rawData = response.data;
    return User.parseUser(rawData);
  }
}
