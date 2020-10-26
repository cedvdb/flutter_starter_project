import 'package:starter_project/screens/main_screen.dart';
import 'package:starter_project/screens/sign_in_screen.dart';
import 'package:starter_project/core/auth/auth.dart';
import 'package:starter_project/screens/splash_screen.dart';

import 'package:flutter/material.dart';

StreamBuilder authGuard = StreamBuilder(
  stream: Auth.authStateChange$,
  builder: (context, snapshot) {
    switch (snapshot.data) {
      case AuthState.PENDING:
        return SplashScreen();
      case AuthState.UNAUTHENTICATED:
        return SignInScreen();
      case AuthState.AUTHENTICATED:
        return MainScreen();
      default:
        return SplashScreen();
    }
  },
);
