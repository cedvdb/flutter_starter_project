import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Restaurant {
  String id;
  String name;
  String description;
  int tables = 1;
  DateTime createdAt;
  String createdBy;

  Restaurant({
    this.id,
    this.name,
    this.description,
    this.tables,
    this.createdAt,
    this.createdBy,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'tables': tables,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'createdBy': createdBy,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Restaurant(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      tables: map['tables'],
      createdAt: map['createdAt'].toDate(),
      createdBy: map['createdBy'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) =>
      Restaurant.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Restaurant(id: $id, name: $name, description: $description, tables: $tables, createdAt: $createdAt, createdBy: $createdBy)';
  }
}
