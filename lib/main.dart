import 'package:eureka_app/app-root/my_localization.dart';
import 'package:eureka_app/app-root/app_info.dart';
import 'package:firebase_core/firebase_core.dart' show Firebase;
import 'package:flutter/material.dart';

import 'app-root/my_injector.dart';
import 'app-root/my_material_app.dart';
import 'main.mapper.g.dart' show initializeJsonMapper;

void main() {
  initializeJsonMapper();
  setupInjectors();
  WidgetsFlutterBinding.ensureInitialized();

  Future preloadPromise = Future.wait([
    AppInfo.init(),
    Firebase.initializeApp().then((value) {
      print("inside promise =================");
    }),
  ]);

  runApp(MyApp(preloadPromise));
}

class MyApp extends StatelessWidget {
  final Future preloadPromise;

  MyApp(this.preloadPromise);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyBlocProviders(
      child: MyLocalization(
        child: MyMaterialApp(child: null),
      ),
    );
  }
}
