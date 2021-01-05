import 'package:eureka_app/utils/errors_service.dart';
import 'package:eureka_app/utils/snackbar_service.dart';
import 'package:get_it/get_it.dart';
import '../ui/screens/startup/home_screen/drawer/drawer_service.dart';

import '../data/sources/_index.dart';

Future setupInjectors() {
  // utils
  GetIt.I.registerSingleton<SnackbarService>(SnackbarService());
  GetIt.I.registerSingleton<ErrorService>(ErrorService());
  GetIt.I.registerSingleton<DrawerService>(DrawerService());
  // data
  GetIt.I.registerSingleton<AuthAPI>(AuthFbAPI());
  GetIt.I.registerSingleton<AuthRepository>(AuthRepository());

  GetIt.I.registerSingleton<UserAPI>(UserFbAPI());
  GetIt.I.registerSingleton<UserRepository>(UserRepository());

  GetIt.I.registerSingleton<RoleAPI>(RoleFbAPI());
  GetIt.I.registerSingleton<RoleRepository>(RoleRepository());

  GetIt.I.registerSingleton<RestaurantAPI>(RestaurantFbAPI());
  GetIt.I.registerSingleton<RestaurantRepository>(RestaurantRepository());
  return GetIt.I.allReady();
}
