import 'package:flutter/material.dart';

class DrawerLink {
  final String name;
  final WidgetBuilder builder;
  final Widget text;
  final Widget icon;

  const DrawerLink({
    this.name,
    this.builder,
    this.text,
    this.icon,
  });
}
