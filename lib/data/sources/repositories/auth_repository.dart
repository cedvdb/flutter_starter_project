import 'package:eureka_app/data/sources/api/api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:get_it/get_it.dart';

class AuthRepository {
  final AuthAPI _authAPI = GetIt.I.get<AuthAPI>();
  final BehaviorSubject<AuthUser> _authUser$ = BehaviorSubject<AuthUser>();
  Stream<AuthUser> get authUser$ => _authUser$.stream;
  AuthUser get authUser => _authUser$.value;

  AuthRepository() {
    _authUser$.addStream(_authAPI.watchAuthUser());
  }

  signIn(AuthProvider provider) {
    return _authAPI.signIn(provider);
  }

  signOut() {
    return _authAPI.signOut();
  }
}
