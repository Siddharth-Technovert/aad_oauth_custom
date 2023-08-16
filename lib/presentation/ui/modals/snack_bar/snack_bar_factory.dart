import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/enums/toast_type.dart';
import 'widgets/message_toast.dart';

abstract class SnackbarFactory {
  SnackbarFactory._();

  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void showNoInternetConnectionSnackbar() {
    scaffoldMessengerKey.currentState!
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16).w,
          duration: const Duration(seconds: 3),
          shape: const RoundedRectangleBorder(),
          content: const Text('Internet Connection Not Available'),
        ),
      );
  }

  static void showToast(
    ToastType toastType,
    String message, {
    String? title,
  }) {
    const int seconds = 3;
    scaffoldMessengerKey.currentState!
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          // backgroundColor: UIColors.light.secondaryScaffoldBackgroundColor,
          backgroundColor: Colors.transparent,
          duration: const Duration(seconds: seconds),
          padding: EdgeInsets.zero,
          elevation: 0,
          content: MessageToast(
            message: message,
            toastType: toastType,
            seconds: seconds,
          ),
        ),
      );
  }

  static void showError(
    String errorMessage, {
    String? title,
  }) {
    SnackbarFactory.showToast(
      ToastType.error,
      errorMessage,
      title: title,
    );
  }
}
