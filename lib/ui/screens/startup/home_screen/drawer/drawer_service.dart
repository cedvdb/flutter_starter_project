import 'package:flutter/material.dart';
import 'package:eureka_app/app-root/routes.dart';
import 'drawer_link.dart';
import 'package:eureka_app/utils/logger.dart';

class DrawerService {
  PageController controller = PageController();
  final List<DrawerLink> links = drawerLinks;
  int _lastIndex = 0;

  DrawerService() {
    log.d('creating');
  }

  init() {
    controller = PageController(initialPage: _lastIndex);
  }

  goTo(String name) {
    final navIndex = links.indexWhere((info) => info.name == name);
    controller.animateToPage(
      navIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
    _lastIndex = navIndex;
  }

  List<Widget> getPages(BuildContext context) {
    return links.map((info) => info.builder(context)).toList();
  }
}
