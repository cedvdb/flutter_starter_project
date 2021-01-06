import 'package:eureka_app/ui/theme/palette.dart';
import 'package:flutter/material.dart';

class DarkTheme extends StatelessWidget {
  final Widget child;

  const DarkTheme({this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: DefaultTextStyle(
        style: TextStyle(color: Palette.foregroundLight[0]),
        child: child,
      ),
    );
  }
}
