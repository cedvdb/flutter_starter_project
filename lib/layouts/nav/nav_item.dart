import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  final Widget icon;
  final Widget text;
  final Function onTap;

  NavItem({this.icon, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    final Widget content = Row(
      children: [
        Container(
          height: 60,
          width: 60,
          child: icon,
        ),
        text
      ],
    );

    if (onTap == null) {
      return content;
    } else {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          child: content,
          onTap: onTap,
        ),
      );
    }
  }
}
