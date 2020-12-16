import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart' show jsonSerializable;

@jsonSerializable
class User {
  String id;
  Timestamp createdAt;
  String restaurantSelected;

  User({this.id, this.createdAt, this.restaurantSelected});
}
