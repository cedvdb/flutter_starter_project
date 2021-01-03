import 'package:eureka_app/data/models/_index.dart';
import 'package:eureka_app/data/sources/api/api.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '_base_repository.dart';
import 'user_repository.dart';
import 'role_repository.dart';

class RestaurantRepository extends BaseRepository<Restaurant> {
  final RestaurantAPI _restaurantAPI = GetIt.I<RestaurantAPI>();
  final RoleRepository _roleRepo = GetIt.I<RoleRepository>();
  final UserRepository _userRepo = GetIt.I<UserRepository>();

  Stream<List<Restaurant>> userRestaurants$;
  Stream<Restaurant> restaurantSelected$;

  RestaurantRepository() {
    super.api = _restaurantAPI;
    userRestaurants$ = _watchUserRestaurants();
    restaurantSelected$ = _watchSelectedRestaurant();
  }

  Stream<List<Restaurant>> _watchUserRestaurants() {
    return _roleRepo.restaurantRoles$
        .where((event) => event != null)
        .map((roles) => roles.map((role) => role.restaurant))
        .switchMap((restaurantIds) =>
            _restaurantAPI.watchRestaurantList(restaurantIds));
  }

  Stream<Restaurant> _watchSelectedRestaurant() {
    return _userRepo.selectedRestaurantId$
        .switchMap((id) => _restaurantAPI.watchOne(id));
  }
}
