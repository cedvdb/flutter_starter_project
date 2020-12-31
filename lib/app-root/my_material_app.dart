import 'package:eureka_app/app-root/app_info.dart';
import 'package:eureka_app/ui/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class MyMaterialApp extends StatelessWidget {
  final Widget child;
  final theme = ThemeData(
    primarySwatch: Palette.primary,
    accentColor: Palette.accent,
    cardColor: Palette.backgroundCard,
    backgroundColor: Palette.background,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  MyMaterialApp({this.child});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppInfo.title,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: theme,
      darkTheme: theme.copyWith(brightness: Brightness.dark),
      home: child,
    );
  }
}
