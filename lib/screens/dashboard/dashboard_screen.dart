import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eureka_app/core/api/user_api.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'bar_chart.dart';

class DashboardPage extends StatelessWidget {
  UserAPI userAPI = GetIt.I.get<UserAPI>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            child: StreamBuilder<DocumentSnapshot>(
              stream: userAPI.user$,
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return Text(snapshot.data.id);
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
