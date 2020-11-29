import 'package:easy_localization/easy_localization.dart';
import 'package:eureka_app/layouts/home_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:eureka_app/screens/sign_in_screen.dart';
import 'package:eureka_app/theme/palette.dart';
import 'package:eureka_app/layouts/app_loader.dart';
import 'package:eureka_app/layouts/auth_guard.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('fr')],
      path: 'assets/translations',
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(kColorPrimaryDark);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
    return MaterialApp(
      title: 'Eureka',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: kColorPrimary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AppLoader(
        future: Firebase.initializeApp(),
        child: AuthGuard(
          unauthenticated: SignInScreen(),
          authenticated: HomeLayout(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(tr('hello')),
    );
  }
}
