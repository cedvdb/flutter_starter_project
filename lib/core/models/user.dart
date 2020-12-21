import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:eureka_app/core/models/_entity.dart';

@JsonSerializable()
class User implements Entity {
  final String id;
  final DateTime createdAt;
  final String restaurantSelected;

  User({this.id, this.createdAt, this.restaurantSelected});

  @override
  String toString() =>
      'User(id: $id, createdAt: $createdAt, restaurantSelected: $restaurantSelected)';
}
