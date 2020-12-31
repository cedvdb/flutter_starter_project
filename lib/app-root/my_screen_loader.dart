import 'package:eureka_app/data/state/auth/auth_cubit.dart';
import 'package:eureka_app/data/state/auth/auth_state.dart';
import 'package:eureka_app/ui/screens/startup/error_screen.dart';
import 'package:eureka_app/ui/screens/startup/home_screen/home_screen.dart';
import 'package:eureka_app/ui/screens/startup/loading_screen.dart';
import 'package:eureka_app/ui/screens/startup/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guards/flutter_guards.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyLoaderGuard extends StatelessWidget {
  final Widget child;
  final Future preload;

  MyLoaderGuard({this.child, this.preload});

  @override
  Widget build(BuildContext context) {
    return LoadingGuard(
      error: ErrorScreen(),
      loading: LoadingScreen(),
      success: child,
    );
  }
}

class MyAuthGuard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthGuard(
      authStream: context.select((AuthCubit auth) => auth
          .map((authState) => authState.status == AuthStatus.authenticated)),
      error: ErrorScreen(),
      loading: LoadingScreen(),
      signedIn: HomeScreen(),
      signedOut: SignInScreen(),
    );
  }
}
