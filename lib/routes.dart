import 'package:eureka_app/ui/screens/_index.dart';
import 'package:flutter/material.dart';
import 'package:flutty/flutty.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabName {
  static const String dashboard = 'dashboard';
  static const String createRestaurant = 'createRestaurant';
  static const String tables = 'tables';
}

final routes = [
  NavInfo(
    target: DashboardScreen(),
    icon: Icon(FontAwesomeIcons.tachometerAlt),
    text: Text('Dashboard'),
    key: TabName.dashboard,
  ),
  NavInfo(
    target: CreateRestaurantScreen(),
    icon: Icon(FontAwesomeIcons.plus),
    text: Text('Create Restaurant'),
    key: TabName.createRestaurant,
  ),
  NavInfo(
    target: CreateRestaurantScreen(),
    icon: Icon(FontAwesomeIcons.qrcode),
    text: Text('QR Codes'),
    key: TabName.tables,
  ),
];
