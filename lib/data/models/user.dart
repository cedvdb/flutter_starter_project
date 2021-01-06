import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'package:eureka_app/data/models/_entity.dart';

@jsonSerializable
class User implements Entity {
  final String id;
  final DateTime createdAt;
  final String restaurantSelected;

  User({this.id, this.createdAt, this.restaurantSelected});

  @override
  String toString() =>
      'User(id: $id, createdAt: $createdAt, restaurantSelected: $restaurantSelected)';

  User copyWith({
    String id,
    DateTime createdAt,
    String restaurantSelected,
  }) {
    return User(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      restaurantSelected: restaurantSelected ?? this.restaurantSelected,
    );
  }
}
