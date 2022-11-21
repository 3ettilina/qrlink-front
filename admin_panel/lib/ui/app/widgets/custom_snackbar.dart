import 'package:admin_panel/ui/app/constants/theme.dart';
import 'package:flutter/material.dart';

enum SnackbarType {
  success(Colors.greenAccent),
  failure(Colors.redAccent),
  warning(Colors.amber),
  info(Colors.indigoAccent);

  const SnackbarType(this.color);

  final Color color;
}

ScaffoldMessengerState showCommonSnackbar(
  BuildContext context, {
  SnackbarType type = SnackbarType.info,
  required String message,
}) =>
    ScaffoldMessenger.of(context)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
            backgroundColor: type.color.withOpacity(0.85),
            content: Text(
              message,
              style: AppTextStyle.h2,
            )),
      );
