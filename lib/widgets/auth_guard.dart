import 'package:flutter/material.dart';
import 'package:starter_project/core/auth/auth.dart';

class AuthGuard extends StatelessWidget {
  final Widget authenticated;
  final Widget unauthenticated;

  AuthGuard({this.authenticated, this.unauthenticated});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth.authState$,
      builder: (context, snapshot) {
        if (snapshot.data == AuthState.AUTHENTICATED) {
          return this.authenticated;
        }
        return this.authenticated;
      },
    );
  }
}
