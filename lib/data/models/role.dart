import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:eureka_app/data/models/_entity.dart';

@jsonSerializable
class UserRole implements Entity {
  final String id;
  final String role;
  final String restaurant;

  UserRole({this.id, this.role, this.restaurant});
}

class RoleName {
  static String owner = 'owner';
  static String manager = 'manager';
  static String employee = 'employee';
}
