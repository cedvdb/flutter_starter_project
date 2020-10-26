import 'package:flutter/material.dart';
import 'package:starter_project/core/auth/auth.dart';
import 'package:starter_project/theme/themes.dart';

class SignInScreen extends StatelessWidget {
  get kSpacingLarge => null;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: kOutsideAppTheme,
      child: Gradient(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(),
              SizedBox(height: kSpacingLarge),
            ],
          ),
        ),
      ),
    );
  }
}

class Gradient extends StatelessWidget {
  final Widget child;

  Gradient({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment
              .bottomRight, // 10% of the width, so there are ten blinds.
          colors: [Colors.lightGreen, Colors.lightBlue], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
    );
  }
}
