import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eureka_app/core/models/restaurant.dart';

import '../api.dart';
import '_collections.dart';
import '_fb_api.dart';

class RestaurantFbAPI extends FbAPI<Restaurant> implements RestaurantAPI {
  RestaurantFbAPI() : super(collection: Col.restaurants);

  @override
  Stream<List<Restaurant>> watchRestaurantList(List<String> restaurantIds) {
    return fs
        .collection(Col.restaurants)
        .where(
          FieldPath.documentId,
          whereIn: restaurantIds,
        )
        .snapshots()
        .map(snapshotToModelList);
  }
}
