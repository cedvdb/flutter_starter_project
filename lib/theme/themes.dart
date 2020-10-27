import 'package:flutter/material.dart';
import 'package:eureka_app/theme/palette.dart';

ThemeData kThemeSecondary =
    ThemeData.dark().copyWith(primaryColor: kColorPrimary);

class SecondaryTheme extends StatelessWidget {
  final Widget child;

  SecondaryTheme({this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(data: kThemeSecondary, child: child);
  }
}
