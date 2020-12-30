class Analytics {
  ItemData overview;
  List<ItemData> monthly;
  List<ItemData> daily;
  List<ItemData> hourly;
}

class AnalyticData {
  int orders;
  int quantity;
  int total;
  ItemData items;
}

class ItemData {
  String id;
  String name;
  int quantity;
  int total;
}
