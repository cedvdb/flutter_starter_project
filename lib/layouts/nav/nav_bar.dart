import 'package:flutter/material.dart';

import 'nav_list.dart';

class NavBar extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const NavBar({
    this.navigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    return NavList();
  }
}
