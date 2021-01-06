import '../../models/role.dart';
import '_base_repository.dart';
import 'user_repository.dart';
import '../api/api.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class RoleRepository extends BaseRepository<Role> {
  final RoleAPI _roleAPI = GetIt.I.get<RoleAPI>();
  final UserRepository _userRepo = GetIt.I.get<UserRepository>();
  final BehaviorSubject<List<Role>> _userRoles$ = BehaviorSubject();
  final BehaviorSubject<List<Role>> _restaurantRoles$ = BehaviorSubject();
  Stream<List<Role>> get userRoles$ => _userRoles$.stream;
  Stream<List<Role>> get restaurantRoles$ => _restaurantRoles$.stream;

  RoleRepository() {
    super.api = _roleAPI;
    _userRoles$.addStream(_watchUserRoles());
    _restaurantRoles$.addStream(_watchRestaurantRoles());
  }

  _watchUserRoles() {
    return _userRepo.userId$
        .switchMap((userId) => _roleAPI.watchUserRoles(userId));
  }

  _watchRestaurantRoles() {
    return _userRepo.selectedRestaurantId$.switchMap(
        (restaurantId) => _roleAPI.watchRestaurantRoles(restaurantId));
  }
}
