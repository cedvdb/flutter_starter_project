import 'package:flutter/material.dart';

import 'nav_list.dart';
import 'package:eureka_app/widgets/gradient_container.dart';

class NavBar extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  const NavBar({
    this.navigatorKey,
  });

  @override
  Widget build(BuildContext context) {
    return GradientContainer(child: NavList());
  }
}
