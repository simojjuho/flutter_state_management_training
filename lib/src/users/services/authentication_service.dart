import 'package:state_training/src/users/domain/core_entities/authentication_response.dart';

import '../controllers/authentication_controller.dart';
import '../domain/core_entities/authentication_msg.dart';
import '../domain/core_entities/user.dart';

class AuthenticationService {
  const AuthenticationService({
    required this.controller,
  });

  final AuthenticationController controller;

  Future<AuthenticationResponse> authenticate(AuthenticationMsg msg) async {
    final result = await controller.authenticate(msg);
    return result;
  }

  Future<User> getProfile(String token) async {
    final user = await controller.getProfile(token);
    return user;
  }
}
