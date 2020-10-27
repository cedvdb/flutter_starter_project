import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:eureka_app/core/auth/auth.dart';

class AuthGuard extends StatelessWidget {
  final Widget authenticated;
  final Widget unauthenticated;

  AuthGuard({this.authenticated, this.unauthenticated});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth.authStateChange$,
      builder: (context, snapshot) {
        // we dont check the stream itself because on hot reload
        // the event will fire with null despite being connected
        return Auth.isAuthenticated ? authenticated : unauthenticated;
      },
    );
  }
}
