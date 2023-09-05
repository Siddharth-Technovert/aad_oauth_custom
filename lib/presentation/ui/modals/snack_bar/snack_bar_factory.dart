import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../domain/enums/toast_type.dart';
import '../../../providers/core/connectivity_provider.dart';
import '../../widgets/custom_text.dart';
import 'widgets/message_toast.dart';

abstract class SnackbarFactory {
  SnackbarFactory._();

  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static void noInternetCheck(
    WidgetRef ref,
    VoidCallback fun,
  ) {
    if (ref.read(connectivityStatusProvider).value == true) {
      fun();
    } else {
      SnackbarFactory.showNoInternetConnectionSnackbar();
    }
  }

  static void showNoInternetConnectionSnackbar() {
    scaffoldMessengerKey.currentState!
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          elevation: 0,
          padding: UIDimensions.symmetricPaddingGeometry(
            horizontal: 24,
            vertical: 16,
          ),
          duration: const Duration(seconds: 3),
          shape: const RoundedRectangleBorder(),
          content:
              const CustomText.bodyMedium('Internet Connection Not Available'),
        ),
      );
  }

  static void _showToast(
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
    String message, {
    String? title,
  }) =>
      _showToast(
        ToastType.error,
        message,
        title: title,
      );

  static void showInfo(
    String message, {
    String? title,
  }) =>
      _showToast(
        ToastType.info,
        message,
        title: title,
      );

  static void showSuccess(
    String message, {
    String? title,
  }) =>
      _showToast(
        ToastType.success,
        message,
        title: title,
      );

  static void showWarning(
    String message, {
    String? title,
  }) =>
      _showToast(
        ToastType.warning,
        message,
        title: title,
      );
}
