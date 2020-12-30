import 'package:eureka_app/utils/snackbar_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'logger.dart';

class ErrorService {
  final snackbars = GetIt.I.get<SnackbarService>();

  ErrorService();

  /// logs error to console, if context is provided will display snackbar
  staticonError({
    Object e,
    String title = 'Error',
    String message,
    BuildContext context,
  }) {
    log.e(e ?? message);
    if (context != null) {
      snackbars.error(context, title, message);
    }
  }
}
