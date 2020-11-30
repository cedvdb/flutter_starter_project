import 'package:eureka_app/widgets/accentuated_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'nav_list.dart';
import 'package:eureka_app/theme/spacing.dart';
import 'package:eureka_app/widgets/logo.dart';

class NavDrawer extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;

  NavDrawer({@required this.navigatorKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: kSpacingM, bottom: kSpacingM),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Logo(size: 30),
                width: 60,
              ),
              AccentuatedText(
                text: "Eureka !",
                style: GoogleFonts.indieFlower(
                  textStyle: TextStyle(fontSize: 40),
                ),
              ),
            ],
          ),
        ),
        NavList(
          navigatorKey: navigatorKey,
          displayText: true,
        ),
      ],
    );
  }
}
