import 'package:eureka_app/screens/create_restaurant_screen.dart';
import 'package:eureka_app/screens/tables_screen.dart';
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
                child: PageView(
                  controller: _pageController,
                  children: [
                    CreateRestaurantPage(),
                    TablesPage(),
                  ],
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

class GradientContainer extends StatelessWidget {
  final Widget child;

  const GradientContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kColorBgGradient1,
            kColorBgGradient2,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    );
  }
}
