import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SnackbarService {
  final Color _infoColor = Colors.lightBlue;
  final Color _errorColor = Colors.red;
  final Color _successColor = Colors.green;

  const SnackbarService();

  info(BuildContext context, String title, String message) {
    show(context, title, message, _infoColor, FontAwesomeIcons.infoCircle);
  }

  success(BuildContext context, String title, String message) {
    show(context, title, message, _successColor, FontAwesomeIcons.checkCircle);
  }

  error(BuildContext context, String title, String message) {
    show(context, title, message, _errorColor,
        FontAwesomeIcons.exclamationCircle);
  }

  show(
    BuildContext context,
    String title,
    String message, [
    Color color = Colors.white,
    IconData icon,
  ]) {
    Flushbar(
      title: title,
      message: message,
      shouldIconPulse: false,
      flushbarPosition: FlushbarPosition.BOTTOM,
      leftBarIndicatorColor: color,
      icon: icon == null
          ? null
          : Icon(
              icon,
              size: 28.0,
              color: color,
            ),
      duration: Duration(seconds: 3),
    ).show(context);
  }
}
