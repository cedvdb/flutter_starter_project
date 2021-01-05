import 'package:eureka_app/data/models/restaurant.dart';
import 'package:eureka_app/data/sources/repositories/restaurant_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

enum CreationStatus { uncreated, creating, created }

class CreationState {
  final Restaurant restaurant;
  final CreationStatus status;

  CreationState([
    this.status,
    this.restaurant,
  ]);
  CreationState.uncreated()
      : status = CreationStatus.uncreated,
        restaurant = null;
  CreationState.creating()
      : status = CreationStatus.creating,
        restaurant = null;
  CreationState.created(this.restaurant) : status = CreationStatus.created;
}

class CreateRestaurantCubit extends Cubit<CreationState> {
  CreateRestaurantCubit() : super(CreationState.uncreated());
  RestaurantRepository _restaurantRepository =
      GetIt.I.get<RestaurantRepository>();

  create({String name}) async {
    emit(CreationState.creating());
    final restaurant =
        await _restaurantRepository.create(Restaurant(name: name));
    emit(CreationState.created(restaurant));
  }
}
