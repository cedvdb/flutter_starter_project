import 'package:easy_localization/easy_localization.dart';
import 'package:eureka_app/ui/theme/palette.dart';
import 'package:eureka_app/ui/theme/spacing.dart';
import 'package:eureka_app/ui/widgets/_index.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ErrorScreen extends StatelessWidget {
  ErrorScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        width: double.infinity,
        child: DarkTheme(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getIcon(),
              SizedBox(
                height: Spacing.l,
              ),
              _getMessage()
            ],
          ),
        ),
      ),
    );
  }

  _getIcon() {
    return Icon(
      FontAwesomeIcons.exclamationCircle,
      size: 100,
      color: Palette.foregroundLight[1],
    );
  }

  _getMessage() {
    return Column(
      children: [
        Text(
          tr('Something wrong happened'),
          style: TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          tr('Please try again'),
          style: TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
