import 'package:flutter/material.dart';

class Palette {
  static const Color primary = Colors.lightBlue;

  /// secondary color is used in conjunction with primary color, for example in gradients
  static const Color secondary = Colors.lightGreen;
  static const Color accent = Colors.amber;
  static const Color warn = Colors.red;
  static const Color success = Colors.lightGreen;
  static const Color info = Colors.lightBlue;
  static const Color background = const Color(0xFFf6f7f9);
  static const Color backgroundCard = Colors.white;

  /// colors of text and icons, going from most important to less
  static const List<Color> foreground = const [
    Colors.black87,
    Colors.black54,
    Colors.black45,
  ];
  static const List<Color> foregroundLight = const [
    Colors.white,
    Colors.white70,
    Colors.white54,
  ];
}
