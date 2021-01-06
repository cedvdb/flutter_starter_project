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

  final BehaviorSubject<List<Restaurant>> _userRestaurants$ = BehaviorSubject();
  final BehaviorSubject<Restaurant> _restaurantSelected$ = BehaviorSubject();

  Stream<List<Restaurant>> get userRestaurants$ => _userRestaurants$.stream;
  Stream<Restaurant> get restaurantSelected$ => _restaurantSelected$.stream;
  Restaurant get restaurantSelected => _restaurantSelected$.value;

  RestaurantRepository() {
    super.api = _restaurantAPI;
    _userRestaurants$.addStream(_watchUserRestaurants());
    _restaurantSelected$.addStream(_watchSelectedRestaurant());
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
