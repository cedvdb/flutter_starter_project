import 'package:easy_localization/easy_localization.dart';
import 'package:eureka_app/app-root/app_info.dart';
import 'package:eureka_app/data/sources/api/api.dart';
import 'package:eureka_app/data/state/auth/auth_cubit.dart';
import 'package:eureka_app/ui/theme/spacing.dart';
import 'package:eureka_app/ui/widgets/_index.dart';
import 'package:eureka_app/ui/widgets/accentuated_text.dart';
import 'package:eureka_app/ui/widgets/gradient_container.dart';
import 'package:eureka_app/ui/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen();

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      child: DarkTheme(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100,
                width: 100,
                child: Logo(),
              ),
              SizedBox(height: Spacing.l),
              AccentuatedText(
                text: AppInfo.appName,
                size: 60,
              ),
              SizedBox(height: Spacing.l),
              for (var provider in AuthProvider.values) ...[
                OutlineIconButton(
                  text: tr(_getText(provider)),
                  icon: _getIcon(provider),
                  onPress: () => context.read<AuthCubit>().signIn(provider),
                  accentColor: Colors.amber,
                ),
                SizedBox(height: Spacing.l),
              ]
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIcon(AuthProvider provider) {
    switch (provider) {
      case AuthProvider.phone:
        return FontAwesomeIcons.envelope;
      case AuthProvider.facebook:
        return FontAwesomeIcons.facebook;
      case AuthProvider.google:
        return FontAwesomeIcons.google;
      case AuthProvider.twitter:
        return FontAwesomeIcons.twitter;
      default:
        throw '$provider not yet supported';
    }
  }

  String _getText(AuthProvider provider) {
    switch (provider) {
      case AuthProvider.phone:
        return 'Sign in with phone';
      case AuthProvider.facebook:
        return 'Sign in with facebook';
      case AuthProvider.google:
        return 'Sign in with google';
      case AuthProvider.twitter:
        return 'Sign in with twitter';
      default:
        throw '$provider not yet supported';
    }
  }
}
