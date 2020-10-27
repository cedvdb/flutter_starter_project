import 'package:eureka_app/screens/create_restaurant_screen.dart';
import 'package:eureka_app/screens/dashboard_screen.dart';
import 'package:eureka_app/screens/tables_screen.dart';
import 'package:eureka_app/widgets/gradient_container.dart';
import 'package:eureka_app/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:eureka_app/theme/palette.dart';

class HomeLayout extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GradientContainer(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavBar(navigatorKey: navigatorKey),
            Expanded(
              child: Container(
                color: kColorBgBackground,
                child: Navigator(
                  key: navigatorKey,
                  transitionDelegate: ,
                  onGenerateRoute: (RouteSettings settings) {
                    print(settings.name);
                    switch (settings.name) {
                      case '/':
                      case '/dashboard':
                        return MaterialPageRoute(
                            builder: (_) => DashboardPage(),

                          );
                      case '/create-restaurant':
                        return MaterialPageRoute(
                            builder: (_) => CreateRestaurantPage());
                      case '/tables':
                        return MaterialPageRoute(builder: (_) => TablesPage());
                      default:
                        return MaterialPageRoute(builder: (_) => TablesPage());
                    }
                  },
                ),
              ),
            )
            // CreateRestaurantPage(),
            // TablesPage()
          ],
        ),
      ),
    );
  }
}
