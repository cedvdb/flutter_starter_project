import 'package:eureka_app/theme/themes.dart';
import 'package:flutter/material.dart';
import 'navigator_container.dart';
import 'nav_list_elements.dart';

class NavList extends StatelessWidget {
  final bool displayText;

  const NavList({this.displayText = false});

  @override
  Widget build(BuildContext context) {
    return SecondaryTheme(
      child: Column(
        children: [
          for (int i = 0; i < tabs.length; i++)
            NavButton(
              tab: tabs[i],
              hasText: displayText,
              onTap: () => NavigatorContainer.navigatorKey.currentState
                  .pushReplacementNamed(tabs[i].route),
            )
        ],
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final TabInfo tab;
  final bool hasText;
  final Function onTap;

  const NavButton({
    this.tab,
    this.hasText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              child: Icon(tab.icon),
            ),
            if (hasText) Text(tab.title)
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
