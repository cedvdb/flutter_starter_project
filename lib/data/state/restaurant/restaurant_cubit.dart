import 'package:eureka_app/data/sources/repositories/restaurant_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'restaurant_state.dart';
import 'package:get_it/get_it.dart';
import '../../models/_index.dart';
import 'package:eureka_app/utils/logger.dart';
import 'package:eureka_app/utils/disposable.dart';
import 'package:rxdart/rxdart.dart';

class RestaurantCubit extends Cubit<RestaurantState> with Disposable {
  RestaurantRepository _restaurantRepo = GetIt.I<RestaurantRepository>();

  RestaurantCubit() : super(RestaurantState.initial()) {
    log.d('restaurant cubit creation');
    _restaurantRepo.restaurantSelected$
        .takeUntil(this)
        .listen(_onRestaurantSelectedChanged);
    _restaurantRepo.userRestaurants$
        .takeUntil(this)
        .listen(_onUserRestaurantsChanged);
  }

  _onRestaurantSelectedChanged(Restaurant restaurant) {
    log.d('on user restaurant changed');
    emit(state.copyWith(restaurantSelected: restaurant));
  }

  _onUserRestaurantsChanged(List<Restaurant> restaurants) {
    emit(state.copyWith(restaurants: restaurants));
  }
}
