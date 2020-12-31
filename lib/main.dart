import 'package:eureka_app/app-root/my_localization.dart';
import 'package:eureka_app/app-root/app_info.dart';
import 'package:eureka_app/utils/logger.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';

import 'app-root/my_injector.dart';
import 'app-root/my_material_app.dart';
import 'main.mapper.g.dart' show initializeJsonMapper;
import 'app-root/my_screen_loader.dart';
import 'app-root/my_bloc_providers.dart';

Future preloadPromise = Future.wait([
  AppInfo.init(),
  Firebase.initializeApp().then((value) {
    setupInjectors();
  }),
  Future.sync(() {
    initializeJsonMapper();
  })
]).whenComplete(() => log.i('preloading completed'));

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp(preloadPromise));
}

class MyApp extends StatelessWidget {
  final Future preload;

  MyApp(this.preload) {}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyLocalization(
      child: MyMaterialApp(
        child: MyLoaderGuard(
          preload: preload,
          child: MyBlocProviders(
            child: MyAuthGuard(),
          ),
        ),
      ),
    );
  }
}
