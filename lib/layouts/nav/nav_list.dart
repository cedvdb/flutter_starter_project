import 'package:eureka_app/core/auth/auth.dart';
import 'package:eureka_app/theme/themes.dart';
import 'package:flutter/material.dart';
import 'navigator_container.dart';
import 'nav_list_elements.dart';
import 'nav_item.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavList extends StatelessWidget {
  final bool displayText;

  const NavList({this.displayText = true});

  @override
  Widget build(BuildContext context) {
    return SecondaryTheme(
      child: Expanded(
        child: Column(
          children: [
            for (int i = 0; i < tabs.length; i++)
              NavItem(
                icon: Icon(tabs[i].icon),
                text: displayText ? Text(tabs[i].title) : null,
                onTap: () => NavigatorContainer.navigatorKey.currentState
                    .pushReplacementNamed(tabs[i].route),
              ),
            Spacer(),
            NavItem(
              icon: Icon(FontAwesomeIcons.signOutAlt),
              text: Text("Logout"),
              onTap: () => Auth.signOut(),
            ),

            // NavButton(
            //   tab: tabs[i],
            //   hasText: displayText,
            //   onTap: () => NavigatorContainer.navigatorKey.currentState
            //       .pushReplacementNamed(tabs[i].route),
            // ),
          ],
        ),
      ),
    );
  }
}
