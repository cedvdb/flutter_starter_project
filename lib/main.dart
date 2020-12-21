import 'package:easy_localization/easy_localization.dart';
import 'package:eureka_app/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutty/flutty.dart' as F;
import 'package:flutty_theme_gradient/flutty_theme_gradient.dart';
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
  // GetIt.I.registerSingleton<UserAPI>(UserAPI());
  // GetIt.I.registerSingleton<RolesAPI>(RolesAPI());
  // GetIt.I.registerSingleton<RestaurantAPI>(RestaurantAPI());
}

class MyApp extends StatelessWidget {
  final Future preloadPromise;

  MyApp(this.preloadPromise);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eureka',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: F.F.palette.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: F.Flutty(
        preload: preloadPromise,
        theme: gradientTheme,
        logo: Image.asset('assets/icons/logo.png'),
        title: 'Eureka !',
        translateFn: tr,
        navList: routes,
        palette: F.F.palette,
      ),
    );
  }
}
