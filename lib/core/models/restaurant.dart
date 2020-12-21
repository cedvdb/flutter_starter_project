import 'package:eureka_app/core/models/_entity.dart';

class Restaurant extends Entity {
  final String id;
  final String name;
  final String description;
  final int tables;
  final DateTime createdAt;
  final String createdBy;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.tables = 1,
    this.createdAt,
    this.createdBy,
  });

  @override
  String toString() {
    return 'Restaurant(id: $id, name: $name, description: $description, tables: $tables, createdAt: $createdAt, createdBy: $createdBy)';
  }
}
