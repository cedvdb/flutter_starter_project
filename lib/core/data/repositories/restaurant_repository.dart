import 'package:eureka_app/core/data/api/api.dart';
import 'package:eureka_app/core/models/_index.dart';
import '_base_repository.dart';
import 'package:rxdart/rxdart.dart';

import 'user_repository.dart';

class RestaurantRepository extends BaseRepository<Restaurant> {
  final RestaurantAPI _restaurantAPI;
  final AuthAPI _authAPI;
  final RoleAPI _roleAPI;
  final UserRepository _userRepository;

  Stream<List<Restaurant>> restaurants$;
  Stream<Restaurant> restaurantSelected$;

  RestaurantRepository({
    RestaurantAPI api,
    AuthAPI authAPI,
    RoleAPI roleAPI,
    UserRepository userRepository,
  })  : _restaurantAPI = api,
        _roleAPI = roleAPI,
        _authAPI = authAPI,
        _userRepository = userRepository,
        super(api: api) {
    restaurants$ = _watchUserRestaurants();
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
