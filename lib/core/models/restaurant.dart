class Restaurant {
  String id;
  String name;
  String description;
  int tables = 1;
  DateTime createdAt;
  String createdBy;

  Restaurant.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
    tables = map['tables'];
    createdBy = map['createdBy'];
    createdAt = map['createdAt'].toDate();
  }

  Map<String, dynamic> toMap() {
    final map = Map();
    map['name'] = name;
    map['description'] = description;
    map['tables'] = tables;
    map['createdBy'] = createdBy;
    map['createdAt'] = createdAt;
    return map;
  }
}
