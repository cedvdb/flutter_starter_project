import 'package:eureka_app/app-root/app_info.dart';
import 'package:eureka_app/ui/theme/palette.dart';
import 'package:eureka_app/ui/theme/spacing.dart';
import 'package:eureka_app/ui/widgets/accentuated_text.dart';
import 'package:eureka_app/ui/widgets/dark_theme.dart';
import 'package:eureka_app/ui/widgets/gradient_container.dart';
import 'package:eureka_app/ui/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  LoadingScreen();

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: DarkTheme(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            Logo(
              size: 100,
            ),
            Spacer(
              flex: 1,
            ),
            SpinKitDoubleBounce(
              color: Palette.foregroundLight[1],
              size: 100,
            ),
            Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: Spacing.s,
                ),
                AccentuatedText(text: AppInfo.title, size: 30),
              ],
            ),
            SizedBox(
              height: Spacing.l,
            ),
          ],
        ),
      ),
    );
  }
}
