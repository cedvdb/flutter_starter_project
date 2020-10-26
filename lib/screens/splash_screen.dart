import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:starter_project/theme/palette.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('splash screen'),
          SpinKitDoubleBounce(color: kColorPrimary),
        ],
      ),
    );
  }
}
