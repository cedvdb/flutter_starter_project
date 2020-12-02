import 'package:flutter/material.dart';

import 'app_bar_eureka.dart';
import 'nav/nav_drawer.dart';
import 'nav/nav_slider.dart';
import 'nav/navigator_container.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The equivalent of the "smallestWidth" qualifier on Android.
    final smallestDimension = MediaQuery.of(context).size.shortestSide;
    // Determine if we should use mobile layout or not. The
    // number 600 here is a common breakpoint for a typical
    // 7-inch tablet.
    final useMobileLayout = smallestDimension < 600;
    return SafeArea(
      child: useMobileLayout ? _buildMobileLayout() : _buildTabletLayout(),
    );

    // return SafeArea(
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Sample Code'),
    //     ),
    //     body: Row(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: [
    //         NavBar(navigatorKey: navigatorKey),
    //         Expanded(
    //           child: Container(
    //             color: kColorBgBackground,
    //             child: Navigator(
    //               key: navigatorKey,
    //               onGenerateRoute: (RouteSettings settings) {
    //                 print(settings.name);
    //                 switch (settings.name) {
    //                   case '/':
    //                   case '/dashboard':
    //                     return MaterialPageRoute(
    //                       builder: (_) => DashboardPage(),
    //                     );
    //                   case '/create-restaurant':
    //                     return MaterialPageRoute(
    //                         builder: (_) => CreateRestaurantPage());
    //                   case '/tables':
    //                     return MaterialPageRoute(builder: (_) => TablesPage());
    //                   default:
    //                     return MaterialPageRoute(builder: (_) => TablesPage());
    //                 }
    //               },
    //             ),
    //           ),
    //         )
    //         // CreateRestaurantPage(),
    //         // TablesPage()
    //       ],
    //     ),
    //   ),
    // );
  }

  _buildMobileLayout() {
    return NavSlider(
      drawer: NavDrawer(),
      appBar: AppBarEureka(
        onMenuTap: () => NavSlider.toggle(),
      ),
      body: NavigatorContainer(),
    );
  }

  _buildTabletLayout() {
    return _buildMobileLayout();
    // return Row(
    //   children: [NavBar(), NavigatorContainer()],
    // );
  }
}
