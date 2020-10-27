import 'package:easy_localization/easy_localization.dart';
import 'package:eureka_app/layouts/home_layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eureka_app/core/auth/auth.dart';
import 'package:eureka_app/theme/spacing.dart';
import 'package:eureka_app/theme/themes.dart';
import 'package:eureka_app/widgets/accentuated_text.dart';
import 'package:eureka_app/widgets/logo.dart';
import 'package:eureka_app/widgets/outline_icon_button.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: kThemeSecondary,
      child: GradientContainer(
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
