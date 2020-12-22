import 'package:eureka_app/core/data/api/api.dart';
import 'package:eureka_app/core/models/_index.dart';
import 'package:rxdart/rxdart.dart';

import '_base_repository.dart';
import 'package:get_it/get_it.dart';

class UserRepository extends BaseRepository<User> {
  Stream<User> user$;
  final AuthAPI _authAPI = GetIt.I<AuthAPI>();
  final UserAPI _userAPI = GetIt.I<UserAPI>();

  UserRepository() {
    super.api = _userAPI;
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
