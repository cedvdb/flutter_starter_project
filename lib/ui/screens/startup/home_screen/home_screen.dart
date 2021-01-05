import 'package:eureka_app/app-root/app_info.dart';
import 'package:eureka_app/data/state/auth/auth_cubit.dart';
import 'package:eureka_app/ui/screens/startup/home_screen/drawer/drawer_content.dart';
import 'package:eureka_app/ui/screens/startup/home_screen/drawer/drawer_layout.dart';
import 'package:eureka_app/ui/screens/startup/home_screen/drawer/drawer_service.dart';
import 'package:eureka_app/ui/widgets/layout_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatelessWidget {
  final DrawerService nav = GetIt.I.get<DrawerService>();

  HomeScreen() {
    nav.init();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerLayout(
      drawer: DrawerContent(
        links: nav.links,
        onLogoutPress: () => context.read<AuthCubit>().signOut(),
        onNavPress: (String key) {
          nav.goTo(key);
          DrawerLayout.toggle();
        },
      ),
      appBar: LayoutAppBar(
        title: AppInfo.title,
        onMenuTap: () => DrawerLayout.toggle(),
      ),
      body: PageView(
        controller: nav.controller,
        children: nav.getPages(context),
      ),
    );
  }
}
