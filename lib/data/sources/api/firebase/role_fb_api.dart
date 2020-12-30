import 'package:eureka_app/data/models/role.dart';

import '../api.dart';
import '_collections.dart';
import '_fb_api.dart';

class RoleFbAPI extends FbAPI<UserRole> implements RoleAPI {
  @override
  Stream<List<UserRole>> watchRestaurantRoles(String restaurantId) {
    return fs
        .collection(Col.roles)
        .where('restaurant', isEqualTo: restaurantId)
        .snapshots()
        .map(snapshotToModelList);
  }

  @override
  Stream<List<UserRole>> watchUserRoles(String userId) {
    print('getting user roles');
    return fs
        .collection(Col.roles)
        .where('user', isEqualTo: userId)
        .snapshots()
        .map(snapshotToModelList);
  }
}