import 'package:flutter/material.dart';
import 'nav_list.dart';
import 'package:eureka_app/widgets/gradient_container.dart';
import 'package:eureka_app/widgets/logo.dart';

class NavDrawer extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  NavDrawer({@required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          child: Logo(),
        ),
        NavList(
          navigatorKey: navigatorKey,
          displayText: true,
        ),
      ],
    );
  }
}
