import 'package:eureka_app/utils/logger.dart';
import 'package:eureka_app/utils/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/state/_index.dart';

class MyBlocProviders extends StatelessWidget {
  final Widget child;

  MyBlocProviders({this.child}) {
    Bloc.observer = MyBlocObserver();
  }

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

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(Cubit cubit) {
    super.onCreate(cubit);
    log.i('onCreate -- cubit: ${cubit.runtimeType}');
  }

  @override
  void onChange(Cubit cubit, Change change) {
    super.onChange(cubit, change);
    log.i('onChange -- cubit: ${cubit.runtimeType}, change: $change');
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    log.e('onError -- cubit: ${cubit.runtimeType}, error: $error');
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onClose(Cubit cubit) {
    super.onClose(cubit);
    log.i('onClose -- cubit: ${cubit.runtimeType}');
  }
}
