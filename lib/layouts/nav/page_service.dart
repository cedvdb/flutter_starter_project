import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tab_info.dart';

class PageService {
  static final PageController controller = PageController(keepPage: false);
  static const List<TabInfo> tabs = [
    TabInfo(
      widget: DashboardPage();
      icon: FontAwesomeIcons.tachometerAlt,
      page: PageName.dashboard,
      title: 'Dashboard',
    ),
    TabInfo(
      widget: CreateRestaurantPage(),
      icon: FontAwesomeIcons.plus,
      page: PageName.createRestaurant,
      title: 'Create Restaurant',
    ),
    TabInfo(
      widget: TablesPage(),
      icon: FontAwesomeIcons.qrcode,
      page: PageName.tables,
      title: 'QR Codes',
    ),
    // FontAwesomeIcons.tachometerAlt,
    // FontAwesomeIcons.clipboardList,
    // FontAwesomeIcons.cartArrowDown,
    // FontAwesomeIcons.history,
    // FontAwesomeIcons.industry,
  ];
  static goTo(PageName page) {
    final tabIndex = tabs.indexWhere((info) => info.page == page);
    controller.animateToPage(
      tabIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }
}
