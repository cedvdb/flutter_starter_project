import 'package:eureka_app/widgets/accentuated_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nav_list.dart';
import 'package:eureka_app/theme/spacing.dart';
import 'package:eureka_app/widgets/logo.dart';
import 'nav_item.dart';

class NavDrawer extends StatelessWidget {
  NavDrawer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TopLogo(),
        NavList(
          displayText: true,
        ),
      ],
    );
  }
}

class TopLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: kSpacingM, bottom: kSpacingM),
      child: NavItem(
        icon: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            child: Logo(size: 20),
          ),
        ),
        text: AccentuatedText(
          text: "Eureka !",
          style: GoogleFonts.indieFlower(
            textStyle: TextStyle(fontSize: 40),
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
