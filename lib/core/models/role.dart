import 'package:cloud_firestore/cloud_firestore.dart';

class UserRole {
  final String role;
  final String restaurant;

  UserRole({this.role, this.restaurant});
}

class Role {
  static String owner = 'owner';
  static String manager = 'manager';
  static String employee = 'employee';
}
