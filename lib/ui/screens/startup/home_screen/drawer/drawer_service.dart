import 'package:flutter/material.dart';

import 'drawer_link.dart';

class DrawerService {
  final PageController controller = PageController(keepPage: false);
  final List<DrawerLink> links;

  DrawerService({this.links});

  goTo(String name) {
    final navIndex = links.indexWhere((info) => info.name == name);
    controller.animateToPage(
      navIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  List<Widget> getPages(BuildContext context) {
    return links.map((info) => info.builder(context)).toList();
  }
}
