import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/assets_gen/assets.gen.dart';
import 'widget/custom_alert_dialog.dart';
import 'widget/custom_alert_title_dialog.dart';

class AlertDialogFactory {
  static final AlertDialogFactory _alertDialogFactory =
      AlertDialogFactory._internal();

  factory AlertDialogFactory() {
    return _alertDialogFactory;
  }
  AlertDialogFactory._internal();

  BuildContext? context;

  void showLoadingDialog(BuildContext ctx1) {
    showDialog(
      context: ctx1,
      barrierDismissible: false,
      barrierColor: Colors.white.withOpacity(0.5),
      builder: (BuildContext ctx) {
        context = ctx;

        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: SizedBox(
              height: 32.h,
              width: 32.w,
              child: const CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }

  Future<void> hideLoadingDialog() async {
    await Future.delayed(const Duration(milliseconds: 50));
    if (context != null) {
      Navigator.pop(context!);
    }
  }

  static void showCustomAlertTitleDialog(
    BuildContext context, {
    required String title,
    required String description,
    required VoidCallback allowCallback,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CustomAlertTitleDialog(
        title: title,
        allowCallback: allowCallback,
        description: description,
      ),
    );
  }

  static Future<bool?> showCustomAlertDialog({
    required BuildContext ctx,
    required VoidCallback allowCallback,
    required String title,
    String? subTitle,
    String? positiveButtonText,
    String? negativeButtonText,
    // SvgGenImage? svgImage,
    AssetGenImage? pngImage,
  }) {
    return showDialog<bool>(
      context: ctx,
      builder: (context) => CustomAlertDialog(
        title: title,
        allowCallBack: allowCallback,
        subtitle: subTitle,
        positiveButtonText: positiveButtonText ?? "Clear",
        negativeButtonText: negativeButtonText ?? "Cancel",
      ),
    );
  }
}
