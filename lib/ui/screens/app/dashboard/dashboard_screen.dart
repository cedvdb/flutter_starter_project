import 'package:flutter/material.dart';
import 'bar_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eureka_app/data/state/_index.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            child: BlocBuilder<RestaurantCubit, RestaurantState>(
              builder: (ctx, state) {
                return Text(state.toString());
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
