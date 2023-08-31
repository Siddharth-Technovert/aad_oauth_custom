import 'package:flutter/material.dart';

import '../../../../core/utils/assets_gen/assets.gen.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../widgets/custom_text.dart';

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
      barrierColor: ctx1.colorScheme.onBackground.withOpacity(0.5),
      builder: (BuildContext ctx) {
        context = ctx;

        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: UIDimensions.sizedBox(
              height: 32,
              width: 32,
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
      builder: (BuildContext context) => AlertDialog(
        title: CustomText.headlineMedium(title),
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
      builder: (context) => AlertDialog(
        title: CustomText.headlineMedium(title),
        content: subTitle == null ? null : CustomText.headlineMedium(subTitle),
        actions: [
          CustomText.headlineMedium(
            negativeButtonText ?? context.appLoc.cancel,
          ),
          CustomText.headlineMedium(
            positiveButtonText ?? context.appLoc.clear,
          ),
        ],
      ),
    );
  }
}
