import 'package:easy_localization/easy_localization.dart';
import 'package:eureka_app/routes.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';
import 'package:flutty/flutty.dart' as F;
import 'package:flutty_theme_gradient/flutty_theme_gradient.dart';
import 'main.mapper.g.dart' show initializeJsonMapper;
import 'package:flutter_bloc/flutter_bloc.dart'
    show BlocProvider, MultiBlocProvider;
import 'core/state/_index.dart';
import 'package:get_it/get_it.dart' show GetIt;
import 'core/data/_index.dart';

void main() {
  initializeJsonMapper();
  setupInjectors();
  WidgetsFlutterBinding.ensureInitialized();

  Future preloadPromise = Firebase.initializeApp().then((value) {
    print("inside promise =================");
    setupInjectors();
  });

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider<UserCubit>(
          create: (BuildContext context) => UserCubit(),
        ),
        BlocProvider<RestaurantCubit>(
          create: (BuildContext context) => RestaurantCubit(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('fr')],
        path: 'assets/translations',
        child: MyApp(preloadPromise),
      ),
    ),
  );
}

void setupInjectors() {
  GetIt.I.registerSingleton<AuthAPI>(AuthFbAPI());
  GetIt.I.registerSingleton<AuthRepository>(AuthRepository());

  GetIt.I.registerSingleton<UserAPI>(UserFbAPI());
  GetIt.I.registerSingleton<UserRepository>(UserRepository());

  GetIt.I.registerSingleton<RoleAPI>(RoleFbAPI());

  GetIt.I.registerSingleton<RestaurantAPI>(RestaurantFbAPI());
  GetIt.I.registerSingleton<RestaurantRepository>(RestaurantRepository());
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
