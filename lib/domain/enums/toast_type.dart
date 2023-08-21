import 'package:flutter/material.dart';

import '../../core/utils/styles/colors/ui_colors_dark.dart';
import '../../core/utils/styles/colors/ui_colors_light.dart';

enum ToastType {
  success(
    "Success",
  ),
  error(
    "Error",
  ),
  warning(
    "Warning",
  ),
  info(
    "Info",
  );

  final String val;
  const ToastType(this.val);
}

extension ToastColors on ToastType {
  Color get lightColor {
    switch (this) {
      case ToastType.success:
        return UIColorsLight().customColors.greenColor!;
      case ToastType.error:
        return UIColorsLight().customColors.redColor!;
      case ToastType.warning:
        return UIColorsLight().customColors.marinerColor!;
      case ToastType.info:
        return UIColorsLight().customColors.greyColor!;
    }
  }

  Color get darkColor {
    switch (this) {
      case ToastType.success:
        return UIColorsDark().customColors.greenColor!;
      case ToastType.error:
        return UIColorsDark().customColors.redColor!;
      case ToastType.warning:
        return UIColorsDark().customColors.marinerColor!;
      case ToastType.info:
        return UIColorsDark().customColors.greyColor!;
    }
  }
}

// extension ToastTypeIconPaths on ToastType {
//   String get lightIconPath {
//     switch (this) {
//       case ToastType.success:
//         return Assets.svg.toastIcons.success.path;
//       case ToastType.error:
//         return Assets.svg.toastIcons.error.path;
//       case ToastType.warning:
//         return Assets.svg.toastIcons.warning.path;
//       case ToastType.info:
//         return Assets.svg.toastIcons.info.path;
//     }
//   }

//   String get darkIconPath {
//     switch (this) {
//       case ToastType.success:
//         return Assets.svg.toastIcons.successDark.path;
//       case ToastType.error:
//         return Assets.svg.toastIcons.errorDark.path;
//       case ToastType.warning:
//         return Assets.svg.toastIcons.warningDark.path;
//       case ToastType.info:
//         return Assets.svg.toastIcons.infoDark.path;
//     }
//   }
// }
