import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyLocalization extends StatelessWidget {
  final Widget child;

  const MyLocalization({this.child});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: [Locale('en'), Locale('fr')],
      path: 'assets/translations',
      child: child,
    );
  }
}
