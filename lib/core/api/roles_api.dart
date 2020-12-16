import 'package:eureka_app/core/models/role.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import '_collections.dart';
import '_fs.dart';
import 'user_api.dart';

class RolesAPI {
  UserAPI _userAPI = GetIt.I.get<UserAPI>();
  ReplayStream<List<UserRole>> userRoles$;

  RolesAPI() {
    userRoles$ = _userAPI.user$
        .map((user) => user.id)
        .switchMap((userId) => _getUserRoles(userId))
        .shareReplay(maxSize: 1);
  }

  Stream<List<UserRole>> _getUserRoles(String userId) {
    final List<String> roles = [Role.owner, Role.manager, Role.employee];

    return fs
        .collection(Col.roles)
        .where('$userId.role', whereIn: roles)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => UserRole(
                  role: doc.data()[userId]['role'],
                  restaurant: doc.id,
                ))
            .toList());
  }
}
