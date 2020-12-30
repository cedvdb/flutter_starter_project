import 'package:eureka_app/ui/widgets/dark_theme.dart';
import 'package:flutter/material.dart';
import 'drawer_button.dart';
import 'drawer_link.dart';

typedef NavFunction(String key);

class DrawerButtonNavList extends StatelessWidget {
  final bool displayText;
  final List<DrawerLink> links;
  final Function onLogoutPress;
  final NavFunction onNavPress;

  DrawerButtonNavList({
    this.displayText = true,
    this.links,
    this.onLogoutPress,
    this.onNavPress,
  });

  @override
  Widget build(BuildContext context) {
    return DarkTheme(
      child: Expanded(
        child: Column(
          children: [
            for (int i = 0; i < links.length; i++)
              NavButton(
                icon: links[i].icon,
                text: displayText ? links[i].text : null,
                onTap: () => onNavPress(links[i].name),
              ),
          ],
        ),
      ),
    );
  }
}
