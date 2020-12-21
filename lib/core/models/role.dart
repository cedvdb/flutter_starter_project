import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eureka_app/core/models/_entity.dart';

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
