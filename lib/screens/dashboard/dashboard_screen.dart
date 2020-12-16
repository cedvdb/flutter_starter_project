import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eureka_app/core/api/user_api.dart';
import 'package:eureka_app/core/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:eureka_app/core/api/restaurant_api.dart';
import 'bar_chart.dart';
import 'package:eureka_app/core/models/restaurant.dart';

class DashboardPage extends StatelessWidget {
  UserAPI userAPI = GetIt.I.get<UserAPI>();
  RestaurantAPI restaurantAPI = GetIt.I.get<RestaurantAPI>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            child: StreamBuilder<Restaurant>(
              stream: restaurantAPI.selectedRestaurant$,
              builder:
                  (BuildContext context, AsyncSnapshot<Restaurant> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return Text(snapshot.data.name);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: AppBarChart(),
            ),
          ),
        ],
      ),
    );
  }
}
