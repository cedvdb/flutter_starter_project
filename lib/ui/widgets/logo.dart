import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double size;

  Logo({this.size = 20});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: Image.asset(
        'assets/icons/logo.png',
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
