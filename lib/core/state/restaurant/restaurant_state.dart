import 'package:eureka_app/core/models/restaurant.dart';

class RestaurantsState {
  final List<Restaurant> restaurants;
  final Restaurant restaurantSelected;

  get hasRestaurant => restaurants.length > 0;
  get hasRestaurantSelected => restaurantSelected != null;

  RestaurantsState({
    this.restaurants,
    this.restaurantSelected,
  });

  RestaurantsState.initial()
      : restaurants = [],
        restaurantSelected = null;

  RestaurantsState copyWith({
    List<Restaurant> restaurants,
    Restaurant restaurantSelected,
  }) {
    return RestaurantsState(
      restaurants: restaurants ?? this.restaurants,
      restaurantSelected: restaurantSelected ?? this.restaurantSelected,
    );
  }
}
