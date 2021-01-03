import 'package:eureka_app/data/sources/api/api.dart';
import 'package:eureka_app/data/sources/repositories/auth_repository.dart';
import 'auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository _authRepo = GetIt.I<AuthRepository>();

  AuthCubit() : super(AuthState.unknown()) {
    _authRepo.authUser$.distinct().takeUntil(this).listen(_onAuthStatusChanged);
  }

  _onAuthStatusChanged(AuthUser authUser) {
    if (authUser.authenticated) {
      emit(AuthState.authenticated(userId: authUser.id));
    } else {
      emit(AuthState.unauthenticated());
    }
  }

  signIn(AuthProvider provider) {
    _authRepo.signIn(provider);
  }

  signOut() {
    _authRepo.signOut();
  }
}
