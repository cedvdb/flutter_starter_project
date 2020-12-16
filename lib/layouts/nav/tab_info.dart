import 'package:flutter/material.dart';

enum PageName {
  dashboard,
  createRestaurant,
  tables,
  history,
}

class TabInfo {
  final Widget widget;
  final IconData icon;
  final String title;
  final PageName page;

  const TabInfo({
    this.widget,
    this.icon,
    this.title,
    this.page,
  });
}
