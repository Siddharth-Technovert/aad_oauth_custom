import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../domain/enums/toast_type.dart';
import 'message_toast.dart';

abstract class ToastFactory {
  const ToastFactory._();

  static void showToast(
    BuildContext context,
    ToastType toastType,
    String message, {
    String? title,
  }) {
    const int seconds = 2;
    final FToast fToast = FToast().init(context);
    fToast
      ..removeCustomToast()
      ..showToast(
        child: MessageToast(
          message: message,
          toastType: toastType,
          onDismiss: () {
            fToast.removeCustomToast();
          },
          seconds: seconds,
          title: title,
        ),
        positionedToastBuilder: (context, child) {
          return Positioned(
            top: 40.0,
            left: 24.0,
            right: 24.0,
            child: child,
          );
        },
        toastDuration: const Duration(seconds: seconds),
      );
  }
}
