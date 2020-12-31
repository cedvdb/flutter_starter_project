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
                text: AppInfo.title,
                size: 60,
              ),
              SizedBox(height: Spacing.l),
              OutlineIconButton(
                text: tr('Sign in with Google'),
                icon: FontAwesomeIcons.google,
                onPress: () =>
                    context.read<AuthCubit>().signIn(AuthProvider.google),
                accentColor: Colors.amber,
              ),
              SizedBox(height: Spacing.l),
            ],
          ),
        ),
      ),
    );
  }
}
