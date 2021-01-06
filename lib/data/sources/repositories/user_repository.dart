import 'package:eureka_app/data/sources/api/api.dart';
import 'package:eureka_app/data/models/_index.dart';
import 'package:rxdart/rxdart.dart';

import '_base_repository.dart';
import 'package:get_it/get_it.dart';
import 'auth_repository.dart';
import 'dart:async';

class UserRepository extends BaseRepository<User> {
  final AuthRepository _authRepo = GetIt.I<AuthRepository>();
  final UserAPI _userAPI = GetIt.I<UserAPI>();
  final BehaviorSubject<User> _user$ = BehaviorSubject<User>();

  Stream<User> get user$ => _user$.stream;
  Stream<String> get userId$ => user$.map((user) => user.id).distinct();
  Stream<String> get selectedRestaurantId$ =>
      user$.map((user) => user.restaurantSelected).distinct();
  User get user => _user$.value;

  UserRepository() {
    super.api = _userAPI;
    _user$.addStream(_watchUserStream());
  }

  Stream<User> _watchUserStream() {
    return _authRepo.authUser$.switchMap((authUser) {
      if (authUser == null) {
        return Stream.value(null);
      }
      return _userAPI.watchOne(authUser.id).where((user) => user != null);
    });
  }
}
