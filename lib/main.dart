import 'package:easy_localization/easy_localization.dart';
import 'package:eureka_app/core/api/user_api.dart';
import 'package:eureka_app/layouts/home_layout.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:eureka_app/screens/sign_in_screen.dart';
import 'package:eureka_app/theme/palette.dart';
import 'package:eureka_app/layouts/app_loader.dart';
import 'package:eureka_app/layouts/auth_guard.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:get_it/get_it.dart';
import 'main.mapper.g.dart' show initializeJsonMapper;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeJsonMapper();

  Future preloadPromise = Firebase.initializeApp().then((value) {
    print("inside promise =================");
    setupInjectors();
  });
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('fr')],
      path: 'assets/translations',
      child: MyApp(preloadPromise),
    ),
  );
}

void setupInjectors() {
  GetIt.I.registerSingleton<UserAPI>(UserAPI());
}

class MyApp extends StatelessWidget {
  final Future preloadPromise;

  MyApp(this.preloadPromise);

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
        future: preloadPromise,
        child: AuthGuard(
          unauthenticated: SignInScreen(),
          authenticated: HomeLayout(),
        ),
      ),
    );
  }
}
