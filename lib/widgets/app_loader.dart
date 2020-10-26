import 'package:flutter/material.dart';
import 'package:starter_project/screens/error_screen.dart';
import 'package:starter_project/screens/splash_screen.dart';

class AppLoader extends StatelessWidget {
  final Future future;
  final Widget child;

  AppLoader({this.child, this.future});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorScreen();
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return child;
        }
        return SplashScreen();
      },
    );
  }
}
