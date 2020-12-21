import 'package:eureka_app/core/data/api/api.dart';
import 'package:eureka_app/core/models/_index.dart';
import 'package:rxdart/rxdart.dart';

import '_base_repository.dart';

class UserRepository extends BaseRepository<User> {
  Stream<User> user$;
  final AuthAPI _authAPI;
  final UserAPI _userAPI;

  UserRepository({UserAPI userAPI, AuthAPI authAPI})
      : _userAPI = userAPI,
        _authAPI = authAPI,
        super(api: userAPI) {
    user$ = _watchUserStream();
  }

  _watchUserStream() {
    return _authAPI.watchAuthUser().switchMap((authUser) {
      if (authUser == null) {
        return Stream.value(null);
      }
      return _userAPI.watchOne(authUser.id);
    });
  }
}
