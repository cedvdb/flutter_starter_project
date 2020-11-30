import 'package:flutter/material.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import 'nav/navigator_container.dart';
import 'nav/nav_drawer.dart';
import 'package:eureka_app/widgets/gradient_container.dart';
import 'nav/nav_list.dart';
import 'nav/nav_slider.dart';

class HomeLayout extends StatelessWidget {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<InnerDrawerState> _innerDrawerKey =
      GlobalKey<InnerDrawerState>();

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
      drawer: NavDrawer(
        navigatorKey: _navigatorKey,
      ),
      appBar: Container(
        child: Text("appbar"),
      ),
      body: Container(
        child: Text("child"),
      ),
    );
  }

  _buildTabletLayout() {
    return Scaffold(
      body: Container(),
    );
  }
}
