import 'package:dart_json_mapper/dart_json_mapper.dart' show jsonSerializable;

@jsonSerializable
class User {
  String id;
  DateTime createdAt;
  String restaurantSelected;

  User({this.id, this.createdAt, this.restaurantSelected});
}
