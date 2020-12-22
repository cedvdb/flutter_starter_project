import 'package:flutter_bloc/flutter_bloc.dart';
import 'restaurant_state.dart';
import 'package:get_it/get_it.dart';
import '../../data/_index.dart';
import '../../models/_index.dart';

class RestaurantCubit extends Cubit<RestaurantState> {
  RestaurantRepository _restaurantRepo = GetIt.I<RestaurantRepository>();

  RestaurantCubit() : super(RestaurantState.initial()) {
    _restaurantRepo.restaurantSelected$.listen(_onRestaurantSelectedChanged);
    _restaurantRepo.userRestaurants$.listen(_onUserRestaurantsChanged);
  }

  _onRestaurantSelectedChanged(Restaurant restaurant) {
    emit(state.copyWith(restaurantSelected: restaurant));
  }

  _onUserRestaurantsChanged(List<Restaurant> restaurants) {
    emit(state.copyWith(restaurants: restaurants));
  }
}
