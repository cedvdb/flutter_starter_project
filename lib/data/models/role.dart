import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'package:eureka_app/data/models/_entity.dart';

@jsonSerializable
class Role implements Entity {
  final String id;
  final String role;
  final String restaurant;

  Role({this.id, this.role, this.restaurant});

  Role copyWith({
    String id,
    String role,
    String restaurant,
  }) {
    return Role(
      id: id ?? this.id,
      role: role ?? this.role,
      restaurant: restaurant ?? this.restaurant,
    );
  }
}

class RoleName {
  static String owner = 'owner';
  static String manager = 'manager';
  static String employee = 'employee';
}
