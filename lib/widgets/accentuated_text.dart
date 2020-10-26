import 'package:flutter/material.dart';
import 'package:starter_project/theme/palette.dart';

// text where the first letter is the accent color
class AccentuatedText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color color;
  final Color accentColor;

  AccentuatedText({
    @required this.text,
    this.style = const TextStyle(),
    this.color = Colors.white,
    this.accentColor = kColorAccent,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: this.text[0],
            style: style.copyWith(color: accentColor),
          ),
          TextSpan(
            text: this.text.substring(1),
            style: style.copyWith(color: color),
          ),
        ],
      ),
    );
  }
}
