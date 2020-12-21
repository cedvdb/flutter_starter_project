import 'package:flutter/material.dart';
import 'bar_chart.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Card(
          //   child: StreamBuilder<Restaurant>(
          //     stream: restaurantAPI.restaurantSelected$,
          //     builder:
          //         (BuildContext context, AsyncSnapshot<Restaurant> snapshot) {
          //       if (snapshot.hasError) {
          //         print(snapshot.error);
          //         return Text('Something went wrong');
          //       }

          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return Text("Loading");
          //       }

          //       return Text(snapshot.data.name);
          //     },
          //   ),
          // ),
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
