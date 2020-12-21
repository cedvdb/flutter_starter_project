import 'package:eureka_app/core/data/api/api.dart';
import 'package:rxdart/rxdart.dart';

class AuthRepository {
  final AuthAPI _authAPI;
  Stream<AuthUser> user$;

  AuthRepository({AuthAPI api}) : _authAPI = api {
    user$ = _authAPI.watchAuthUser().shareReplay(maxSize: 1);
  }

  signIn(AuthProvider provider) {
    return _authAPI.signIn(provider);
  }

  signOut() {
    return _authAPI.signOut();
  }
}
