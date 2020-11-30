import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

final List<TabInfo> tabs = const [
  TabInfo(
      icon: FontAwesomeIcons.tachometerAlt,
      title: 'Dashboard',
      route: '/dashboard'),
  TabInfo(
      icon: FontAwesomeIcons.plus,
      title: 'Create Restaurant',
      route: '/create-restaurant'),
  TabInfo(icon: FontAwesomeIcons.qrcode, title: 'QR Codes', route: '/tables'),
  // FontAwesomeIcons.tachometerAlt,
  // FontAwesomeIcons.clipboardList,
  // FontAwesomeIcons.cartArrowDown,
  // FontAwesomeIcons.history,
  // FontAwesomeIcons.industry,
];

class TabInfo {
  final IconData icon;
  final String title;
  final String route;

  const TabInfo({
    this.icon,
    this.title,
    this.route,
  });
}
