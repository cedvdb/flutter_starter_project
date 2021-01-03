import 'package:eureka_app/data/sources/api/api.dart';
import 'package:rxdart/rxdart.dart';
import 'package:get_it/get_it.dart';

class AuthRepository {
  final AuthAPI _authAPI = GetIt.I.get<AuthAPI>();
  Stream<AuthUser> authUser$;

  AuthRepository() {
    authUser$ = _authAPI.watchAuthUser().shareReplay(maxSize: 1);
  }

  signIn(AuthProvider provider) {
    return _authAPI.signIn(provider);
  }

  signOut() {
    return _authAPI.signOut();
  }
}
