import 'package:eureka_app/ui/theme/palette.dart';
import 'package:eureka_app/ui/theme/spacing.dart';
import 'package:eureka_app/ui/widgets/dark_theme.dart';
import 'package:eureka_app/ui/widgets/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  final Widget logo;

  LoadingScreen({
    this.logo,
  });

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: DarkTheme(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            SpinKitDoubleBounce(
              color: Palette.foregroundLight[1],
              size: 100,
            ),
            Spacer(),
            if (logo != null) logo,
            SizedBox(
              height: Spacing.l,
            ),
          ],
        ),
      ),
    );
  }
}
