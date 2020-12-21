enum AuthStatus { authenticated, unauthenticated, unknown }

class AuthState {
  final AuthStatus status;
  final String userId;

  const AuthState._({
    this.status = AuthStatus.unknown,
    this.userId,
  });

  const AuthState.unknown() : this._();

  const AuthState.authenticated({String userId})
      : this._(status: AuthStatus.authenticated, userId: userId);

  const AuthState.unauthenticated()
      : this._(status: AuthStatus.unauthenticated);

  @override
  String toString() => 'AuthState(status: $status, userId: $userId)';
}
