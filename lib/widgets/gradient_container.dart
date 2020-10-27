import 'package:eureka_app/theme/palette.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final List<Color> colors;
  final List<Alignment> align;

  GradientContainer({
    this.child,
    this.colors = const [kColorBgGradient1, kColorBgGradient2],
    this.align = const [Alignment.topLeft, Alignment.bottomRight],
  }) : assert(colors.length >= 2 && align.length >= 2);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors,
        ),
      ),
    );
  }
}
