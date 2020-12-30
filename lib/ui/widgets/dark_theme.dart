import 'package:flutter/material.dart';

class DarkTheme extends StatelessWidget {
  final Widget child;

  const DarkTheme({this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: child,
    );
  }
}
