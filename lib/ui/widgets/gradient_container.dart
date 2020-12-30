import 'package:eureka_app/ui/theme/palette.dart';
import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget child;
  final List<Color> colors;
  final List<Alignment> align;
  final double width;
  final double height;

  GradientContainer({
    this.child,
    this.colors,
    this.align = const [Alignment.topLeft, Alignment.bottomRight],
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colors ?? [Palette.primary, Palette.secondary],
        ),
      ),
    );
  }
}
