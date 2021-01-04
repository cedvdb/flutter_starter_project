import 'package:eureka_app/data/sources/api/api.dart';
import 'package:eureka_app/data/models/_index.dart';
import 'package:rxdart/rxdart.dart';

import '_base_repository.dart';
import 'package:get_it/get_it.dart';
import 'auth_repository.dart';
import 'dart:async';

class UserRepository extends BaseRepository<User> {
  Stream<User> user$;
  Stream<String> userId$;
  Stream<String> selectedRestaurantId$;

  final AuthRepository _authRepo = GetIt.I<AuthRepository>();
  final UserAPI _userAPI = GetIt.I<UserAPI>();

  UserRepository() {
    super.api = _userAPI;
    user$ = _watchUserStream();
    userId$ = user$.map((user) => user.id).distinct();
    selectedRestaurantId$ =
        user$.map((user) => user.restaurantSelected).distinct();
  }

  _watchUserStream() {
    return _authRepo.authUser$.switchMap((authUser) {
      if (authUser == null) {
        return Stream.value(null);
      }
      return _userAPI
          .watchOne(authUser.id)
          .doOnData((user) => _createUserIfNotExist(user))
          .where((user) => user != null);
    });
  }

  _createUserIfNotExist(User user) {
    if (user == null) {
      final authUser = _authRepo.authUser;
      _userAPI.create(User(id: authUser.id, createdAt: DateTime.now()));
    }
  }
}
