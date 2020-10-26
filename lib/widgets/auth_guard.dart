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
        print('builder ${snapshot.data}');
        if (snapshot.data == AuthState.AUTHENTICATED) {
          return authenticated;
        }
        return unauthenticated;
      },
    );
  }
}
