import 'package:flutter/material.dart';
import 'package:starter_project/core/auth/auth.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          onPressed: () {
            Auth.signInWithGoogle();
          },
          child: Text('Sign in with google'),
        )
      ],
    );
  }
}
