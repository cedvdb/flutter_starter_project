import 'package:easy_localization/easy_localization.dart';
import 'package:eureka_app/app-root/app_info.dart';
import 'package:eureka_app/ui/screens/startup/home_screen/drawer/drawer_link.dart';
import 'package:eureka_app/ui/theme/spacing.dart';
import 'package:eureka_app/ui/widgets/accentuated_text.dart';
import 'package:eureka_app/ui/widgets/dark_theme.dart';
import 'package:eureka_app/ui/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'drawer_button.dart';
import 'drawer_button_nav_list.dart';

class DrawerContent extends StatelessWidget {
  final List<DrawerLink> links;
  final Function onLogoutPress;
  final NavFunction onNavPress;

  DrawerContent({
    this.links,
    this.onLogoutPress,
    this.onNavPress,
  });

  @override
  Widget build(BuildContext context) {
    return DarkTheme(
      child: Column(
        children: [
          TopLogo(),
          DrawerButtonNavList(
            displayText: true,
            links: this.links,
            onLogoutPress: this.onLogoutPress,
            onNavPress: this.onNavPress,
          ),
          Spacer(),
          NavButton(
            icon: Icon(FontAwesomeIcons.signOutAlt),
            text: Text(
              tr('Logout'),
              style: TextStyle(fontSize: 16),
            ),
            onTap: onLogoutPress,
          ),
        ],
      ),
    );
  }
}

class TopLogo extends StatelessWidget {
  TopLogo();

  @override
  Widget build(BuildContext context) {
    return DarkTheme(
      child: Container(
        margin: EdgeInsets.only(
          top: Spacing.m + MediaQuery.of(context).padding.top,
          bottom: Spacing.m,
        ),
        child: NavButton(
          icon: Center(
            child: Container(
              height: 30,
              width: 30,
              child: Logo(),
            ),
          ),
          text: AccentuatedText(
            text: AppInfo.title,
            size: 40,
          ),
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
