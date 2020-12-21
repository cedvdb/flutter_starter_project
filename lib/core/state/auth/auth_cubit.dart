import 'dart:async';

import 'package:eureka_app/core/data/api/api.dart';
import 'package:eureka_app/core/data/repositories/auth_repository.dart';
import 'auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  StreamSubscription<AuthUser> _authUserSubscription;
  AuthRepository _authRepo;

  AuthCubit({AuthRepository authRepo})
      : _authRepo = authRepo,
        super(AuthState.unknown()) {
    _authUserSubscription = authRepo.user$.listen(
      (user) => _onAuthStatusChanged(user),
    );
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

  @override
  Future<void> close() {
    _authUserSubscription?.cancel();
    return super.close();
  }
}
