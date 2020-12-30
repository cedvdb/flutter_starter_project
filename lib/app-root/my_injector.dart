import 'package:eureka_app/utils/errors_service.dart';
import 'package:eureka_app/utils/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../data/sources/_index.dart';
import '../data/state/_index.dart';

void setupInjectors() {
  // utils
  GetIt.I.registerSingleton<SnackbarService>(SnackbarService());
  GetIt.I.registerSingleton<ErrorService>(ErrorService());
  // data
  GetIt.I.registerSingleton<AuthAPI>(AuthFbAPI());
  GetIt.I.registerSingleton<AuthRepository>(AuthRepository());

  GetIt.I.registerSingleton<UserAPI>(UserFbAPI());
  GetIt.I.registerSingleton<UserRepository>(UserRepository());

  GetIt.I.registerSingleton<RoleAPI>(RoleFbAPI());

  GetIt.I.registerSingleton<RestaurantAPI>(RestaurantFbAPI());
  GetIt.I.registerSingleton<RestaurantRepository>(RestaurantRepository());
}

class MyBlocProviders extends StatelessWidget {
  final Widget child;

  const MyBlocProviders({this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(),
        ),
        BlocProvider<UserCubit>(
          create: (BuildContext context) => UserCubit(),
        ),
        BlocProvider<RestaurantCubit>(
          create: (BuildContext context) => RestaurantCubit(),
        ),
      ],
      child: child,
    );
  }
}
