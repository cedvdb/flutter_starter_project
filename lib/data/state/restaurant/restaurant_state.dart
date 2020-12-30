import 'package:eureka_app/data/models/restaurant.dart';

class RestaurantState {
  final List<Restaurant> restaurants;
  final Restaurant restaurantSelected;

  get hasRestaurant => restaurants.length > 0;
  get hasRestaurantSelected => restaurantSelected != null;

  RestaurantState({
    this.restaurants,
    this.restaurantSelected,
  });

  RestaurantState.initial()
      : restaurants = [],
        restaurantSelected = null;

  RestaurantState copyWith({
    List<Restaurant> restaurants,
    Restaurant restaurantSelected,
  }) {
    return RestaurantState(
      restaurants: restaurants ?? this.restaurants,
      restaurantSelected: restaurantSelected ?? this.restaurantSelected,
    );
  }
}
