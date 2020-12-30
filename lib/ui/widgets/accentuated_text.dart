import 'package:eureka_app/ui/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// text where the first letter is the accent color
class AccentuatedText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final Color accentColor;
  final double size;

  AccentuatedText({
    @required this.text,
    TextStyle style,
    this.size,
    this.accentColor,
  })  : assert(size == null || style == null),
        style = style ??
            GoogleFonts.indieFlower(
              textStyle: TextStyle(fontSize: size),
            );

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: this.text[0],
            style: style.copyWith(
              color: accentColor ?? Palette.accent,
            ),
          ),
          TextSpan(
            text: this.text.substring(1),
            style: style,
          ),
        ],
      ),
    );
  }
}
