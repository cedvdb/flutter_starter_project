import 'package:eureka_app/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavBar extends StatelessWidget {
  final Function onTabPress;
  final tabs = const [
    FontAwesomeIcons.plus,
    // FontAwesomeIcons.tachometerAlt,
    // FontAwesomeIcons.clipboardList,
    FontAwesomeIcons.qrcode,
    // FontAwesomeIcons.cartArrowDown,
    // FontAwesomeIcons.history,
    // FontAwesomeIcons.industry,
  ];

  const NavBar({this.onTabPress});

  @override
  Widget build(BuildContext context) {
    return SecondaryTheme(
      child: Column(
        children: [
          for (int i = 0; i < tabs.length; i++)
            NavButton(
              icon: tabs[i],
              onTap: () => onTabPress(i),
            )
        ],
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  const NavButton({@required this.icon, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Container(
          height: 60,
          width: 60,
          child: Icon(icon),
        ),
        onTap: onTap,
      ),
    );
  }
}
