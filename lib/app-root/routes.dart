import 'package:eureka_app/ui/screens/app/_index.dart';
import 'package:eureka_app/ui/screens/startup/home_screen/drawer/drawer_link.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageName {
  static const String dashboard = 'dashboard';
  static const String createRestaurant = 'createRestaurant';
  static const String tables = 'tables';
}

final drawerLinks = [
  DrawerLink(
    name: PageName.dashboard,
    builder: (context) => DashboardScreen(),
    icon: Icon(FontAwesomeIcons.tachometerAlt),
    text: Text('Dashboard'),
  ),
  DrawerLink(
    name: PageName.createRestaurant,
    builder: (context) => CreateRestaurantScreen(),
    icon: Icon(FontAwesomeIcons.plus),
    text: Text('Create Restaurant'),
  ),
  DrawerLink(
    name: PageName.tables,
    builder: (context) => CreateRestaurantScreen(),
    icon: Icon(FontAwesomeIcons.qrcode),
    text: Text('QR Codes'),
  ),
];
