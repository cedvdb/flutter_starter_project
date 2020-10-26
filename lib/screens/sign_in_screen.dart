import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:starter_project/core/auth/auth.dart';
import 'package:starter_project/theme/spacing.dart';
import 'package:starter_project/theme/themes.dart';
import 'package:starter_project/widgets/accentuated_text.dart';
import 'package:starter_project/widgets/logo.dart';
import 'package:starter_project/widgets/outline_icon_button.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: kOutsideAppTheme,
      child: Gradient(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Logo(
                size: 200,
              ),
              SizedBox(height: kSpacingL),
              AccentuatedText(
                text: 'Starter !',
                style: GoogleFonts.indieFlower(
                  textStyle: TextStyle(fontSize: 40),
                ),
              ),
              SizedBox(height: kSpacingL),
              OutlineIconButton(
                text: '${tr('Sign in with')} Google',
                icon: FontAwesomeIcons.google,
                onPress: () => Auth.signInWithGoogle(),
                accentColor: Colors.amber,
              ),
              SizedBox(height: kSpacingM),
              OutlineIconButton(
                text: '${tr('Sign in with')} Phone',
                icon: FontAwesomeIcons.phoneAlt,
                onPress: () => Auth.signInWithGoogle(),
                accentColor: Colors.amber,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Gradient extends StatelessWidget {
  final Widget child;

  Gradient({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment
              .bottomRight, // 10% of the width, so there are ten blinds.
          colors: [Colors.lightGreen, Colors.lightBlue], // whitish to gray
          tileMode: TileMode.repeated, // repeats the gradient over the canvas
        ),
      ),
    );
  }
}
