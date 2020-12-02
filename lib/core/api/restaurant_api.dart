import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eureka_app/core/api/user_api.dart';
import 'package:eureka_app/core/models/restaurant.dart';
import 'package:eureka_app/core/models/role.dart';
import 'package:eureka_app/core/models/user.dart';

import '_collections.dart';
import '_fs.dart';
import 'roles_api.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class RestaurantAPI {
  RolesAPI _rolesAPI = GetIt.I.get<RolesAPI>();
  UserAPI _userAPI = GetIt.I.get<UserAPI>();

  ReplayStream<List<Restaurant>> restaurants$;
  ReplayStream<bool> hasRestaurant$;
  ReplayStream<Restaurant> selectedRestaurant$;

  RestaurantAPI() {
    restaurants$ =
        _rolesAPI.userRoles$.switchMap((roles) => _getUserRestaurants(roles));
    hasRestaurant$ = _rolesAPI.userRoles$.map((roles) => roles.length > 0);
    selectedRestaurant$ = _getSelectedRestaurant();
  }

  ReplayStream<List<Restaurant>> _getUserRestaurants(List<UserRole> roles) {
    return fs
        .collection(Col.restaurants)
        .where(
          FieldPath.documentId,
          whereIn: roles.map((role) => role.restaurant).toList(),
        )
        .snapshots()
        .map((snap) => snap.docs.map((doc) => Restaurant.fromMap(doc.data())))
        .shareReplay(maxSize: 1);
  }

  Stream<Restaurant> _getSelectedRestaurant() {
    return CombineLatestStream.list([_userAPI.user$, restaurants$])
        .map((values) {
      final User user = values[0];
      final List<Restaurant> restaurants = values[1];
      return restaurants.firstWhere((r) => r.id == user.restaurantSelected);
    });
  }

  createRestaurant(Restaurant restaurant) async {
    try {
      restaurant.createdBy = _userAPI.user$.values.first.id; 
      final map = restaurant.toMap();
      // adding created at in map because it's not the same type
      map['createdAt'] = FieldValue.serverTimestamp();
      
      final added = await fs.collection(Col.restaurants).add(map);
      await this.userSrv.update({ restaurantSelected: added.id });
      // wait for selected restaurant
      await this.selectedRestaurant$.pipe(
        filter(r => r.id === added.id),
        take(1)
      ).toPromise();
      return added;
    } catch (e) {
      console.error(e);
    }
  }

  // select(restaurant: string) {
  //   return this.userSrv.update({ restaurantSelected: restaurant });
  // }

  // update(restaurant: Restaurant) {
  //   return this.fs.collection(Col.RESTAURANTS)
  //     .doc<Restaurant>(restaurant.id)
  //     .set(restaurant, { merge: true });
  // }

}
