import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../core/services/navigation_service.dart';
import '../models/failure.dart';

class VbaFlushBar {
  static void showFailure({
    // required BuildContext context,
    required Failure failure,
    bool showTitle = true,
    Color? color,
    Duration? duration,
  }) {
    Flushbar<dynamic>(
      flushbarPosition: FlushbarPosition.BOTTOM,
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: color ?? Colors.red.shade600,
      margin: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(8),
      message: failure.message,
      title: showTitle ? failure.title : null,
    ).show(NavigationService.instance.navigatorKey.currentContext!);
  }
}
