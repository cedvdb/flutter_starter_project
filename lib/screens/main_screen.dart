import 'package:flutter/material.dart';
import 'package:eureka_app/core/auth/auth.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            Text('main screen'),
            RaisedButton(
              child: Text('logout'),
              onPressed: () => Auth.signOut(),
            ),
          ],
        ),
      ),
    );
  }
}
