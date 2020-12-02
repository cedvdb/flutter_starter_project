import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class User {
  String id;
  DateTime createdAt;
  String restaurantSelected;
}
