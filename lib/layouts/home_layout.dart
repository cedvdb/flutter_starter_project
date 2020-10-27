import 'package:eureka_app/screens/create_restaurant_screen.dart';
import 'package:eureka_app/screens/dashboard_screen.dart';
import 'package:eureka_app/screens/tables_screen.dart';
import 'package:eureka_app/widgets/gradient_container.dart';
import 'package:eureka_app/widgets/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:eureka_app/theme/palette.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GradientContainer(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavBar(
              onTabPress: (i) => _pageController.animateToPage(
                i,
                curve: Curves.easeInCubic,
                duration: Duration(milliseconds: 400),
              ),
            ),
            Expanded(
              child: Container(
                color: kColorBgBackground,
                child: Navigator(
                  onGenerateRoute: (RouteSettings settings) {
                    var a = Router();
                    print(settings.name);
                    switch (settings.name) {
                      case '/':
                        return MaterialPageRoute(
                            builder: (_) => DashboardPage());
                      case '/create-restaurent':
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
