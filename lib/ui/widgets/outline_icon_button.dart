import 'package:flutter/material.dart';

class OutlineIconButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPress;
  final Color accentColor;

  const OutlineIconButton(
      {this.text, this.icon, this.onPress, this.accentColor});

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: onPress,
      splashColor: accentColor,
      borderSide: BorderSide(color: accentColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      highlightedBorderColor: Colors.white54,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              icon,
              size: 20,
              color: accentColor,
            ),
            SizedBox(width: 16),
            Text(
              text,
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
