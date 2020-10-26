import 'package:flutter/material.dart';
import 'package:starter_project/core/auth/auth.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('main screen'),
          RaisedButton(
            child: Text('logout'),
            onPressed: () => Auth.signOut(),
          ),
        ],
      ),
    );
  }
}
