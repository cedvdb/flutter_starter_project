import 'package:eureka_app/screens/create_restaurant_screen.dart';
import 'package:eureka_app/screens/dashboard/dashboard_screen.dart';
import 'package:eureka_app/screens/tables_screen.dart';
import 'package:eureka_app/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigatorContainer extends StatelessWidget {
  NavigatorContainer();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kColorBgBackground,
      child: Navigator(
        key: Get.nestedKey(1),
        onGenerateRoute: (RouteSettings settings) {
          print(settings.name);
          switch (settings.name) {
            case '/':
            case '/dashboard':
              return MaterialPageRoute(
                builder: (_) => DashboardPage(),
              );
            case '/create-restaurant':
              return MaterialPageRoute(builder: (_) => CreateRestaurantPage());
            case '/tables':
              return MaterialPageRoute(builder: (_) => TablesPage());
            default:
              return MaterialPageRoute(builder: (_) => TablesPage());
          }
        },
      ),
    );
  }
}
