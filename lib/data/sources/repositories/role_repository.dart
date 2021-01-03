import '../../models/role.dart';
import '_base_repository.dart';
import 'user_repository.dart';
import '../api/api.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class RoleRepository extends BaseRepository<Role> {
  RoleAPI _roleAPI = GetIt.I.get<RoleAPI>();
  UserRepository _userRepo = GetIt.I.get<UserRepository>();
  Stream<List<Role>> userRoles$;
  Stream<List<Role>> restaurantRoles$;

  RoleRepository() {
    super.api = _roleAPI;
    userRoles$ = _userRepo.userId$
        .switchMap((userId) => _roleAPI.watchUserRoles(userId));
    restaurantRoles$ = _userRepo.selectedRestaurantId$.switchMap(
        (restaurantId) => _roleAPI.watchRestaurantRoles(restaurantId));
  }
}
