import 'package:flutter/material.dart';
import 'nav/navigator_container.dart';
import 'nav/nav_drawer.dart';

class HomeLayout extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
    return Scaffold(
        appBar: AppBar(
          title: Text("Eureka"),
        ),
        drawer: NavDrawer(navigatorKey: navigatorKey),
        body: NavigatorContainer(navigatorKey: navigatorKey));
  }

  _buildTabletLayout() {
    return Scaffold(
      body: Container(),
    );
  }
}
