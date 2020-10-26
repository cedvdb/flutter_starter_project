import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:starter_project/screens/main_screen.dart';
import 'package:starter_project/screens/sign_in_screen.dart';
import 'package:starter_project/theme/palette.dart';
import 'package:starter_project/widgets/app_loader.dart';
import 'package:starter_project/widgets/auth_guard.dart';

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
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        primarySwatch: kColorPrimary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AppLoader(
        future: Firebase.initializeApp(),
        child: AuthGuard(
          unauthenticated: SignInScreen(),
          authenticated: MainScreen(),
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
