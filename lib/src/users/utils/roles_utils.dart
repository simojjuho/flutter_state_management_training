import 'package:state_training/src/users/domain/enums/roles.dart';

class RolesUtils {
  static Roles parseRole(String data) {
    switch (data) {
      case 'customer':
        return Roles.customer;
      case 'admin':
        return Roles.admin;
      default:
        throw ArgumentError.value('Role must be either admin or customer.');
    }
  }
}
