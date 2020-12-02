import 'package:get_it/get_it.dart';
import 'user_api.dart';
import 'package:rxdart/rxdart.dart';
import '_fs.dart';
import '_collections.dart';
import 'package:eureka_app/core/models/role.dart';

class RolesAPI {
  UserAPI _userAPI = GetIt.I.get<UserAPI>();
  ReplayStream<List<UserRole>> userRoles$;

  RolesAPI() {
    userRoles$ = _userAPI.user$
        .map((user) => user.id)
        .switchMap((userId) => _getUserRoles(userId));
  }

  ReplayStream<List<UserRole>> _getUserRoles(String userId) {
    return fs
        .collection(Col.roles)
        .where(userId, whereIn: Role.values)
        .snapshots()
        .map((snap) => snap.docs.map((doc) => UserRole(
              doc.data()[userId],
              doc.id,
            )))
        .shareReplay(maxSize: 1);
  }
}
