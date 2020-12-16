import 'package:eureka_app/core/auth/auth.dart';
import 'package:eureka_app/theme/themes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'page_service.dart';
import 'nav_item.dart';
import 'tab_info.dart';

class NavList extends StatelessWidget {
  final bool displayText;
  final List<TabInfo> tabs = PageService.tabs;

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
                onTap: () => PageService.goTo(tabs[i].page),
              ),
            Spacer(),
            NavItem(
              icon: Icon(FontAwesomeIcons.signOutAlt),
              text: Text("Logout"),
              onTap: () => Auth.signOut(),
            ),
          ],
        ),
      ),
    );
  }
}
