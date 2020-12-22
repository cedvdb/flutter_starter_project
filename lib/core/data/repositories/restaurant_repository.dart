import 'package:eureka_app/core/data/api/api.dart';
import 'package:eureka_app/core/models/_index.dart';
import '_base_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'user_repository.dart';
import 'package:get_it/get_it.dart';

class RestaurantRepository extends BaseRepository<Restaurant> {
  final RestaurantAPI _restaurantAPI = GetIt.I<RestaurantAPI>();
  final AuthAPI _authAPI = GetIt.I<AuthAPI>();
  final RoleAPI _roleAPI = GetIt.I<RoleAPI>();
  final UserRepository _userRepository = GetIt.I<UserRepository>();

  Stream<List<Restaurant>> userRestaurants$;
  Stream<Restaurant> restaurantSelected$;

  RestaurantRepository() {
    super.api = _restaurantAPI;
    userRestaurants$ = _watchUserRestaurants();
    restaurantSelected$ = _watchSelectedRestaurant();
  }

  Stream<List<Restaurant>> _watchUserRestaurants() {
    return _watchUserRoles()
        .where((event) => event != null)
        .map((roles) => roles.map((role) => role.restaurant))
        .switchMap((restaurantIds) =>
            _restaurantAPI.watchRestaurantList(restaurantIds));
  }

  Stream<Restaurant> _watchSelectedRestaurant() {
    return _userRepository.user$
        .map((user) => user.restaurantSelected)
        .distinct()
        .switchMap((id) => _restaurantAPI.watchOne(id));
  }

  Stream<List<UserRole>> _watchUserRoles() {
    return _authAPI.watchAuthUser().switchMap((authUser) {
      if (authUser == null) {
        return Stream.value(null);
      }
      return _roleAPI.watchUserRoles(authUser.id);
    });
  }
}
