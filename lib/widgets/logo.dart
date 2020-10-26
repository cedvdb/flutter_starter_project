import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  double size = 20;

  Logo({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Image.asset(
        'assets/icons/logo.png',
      ),
    );
  }
}
