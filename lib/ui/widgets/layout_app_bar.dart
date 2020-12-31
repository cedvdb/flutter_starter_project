import 'package:eureka_app/ui/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'accentuated_text.dart';
import 'dark_theme.dart';
import 'gradient_container.dart';

class LayoutAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function onMenuTap;
  final Color color;

  LayoutAppBar({
    this.title,
    this.onMenuTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return DarkTheme(
      child: GradientContainer(
        child: AppBar(
          backgroundColor: color ?? Palette.primary,
          leading: IconButton(
            onPressed: onMenuTap,
            icon: Icon(
              FontAwesomeIcons.bars,
            ),
          ),
          title: Container(
            height: 40,
            child: AccentuatedText(
              text: title,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
