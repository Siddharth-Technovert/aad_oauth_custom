import 'package:flutter/material.dart';

enum ToastType {
  success(
    "Success",
    Color(0xff4ac39e),
  ),
  error(
    "Error",
    Color(0xffed5f53),
  ),
  warning(
    "Warning",
    Color(0xffffce68),
  ),
  info(
    "Info",
    Color(0xffaab2f6),
  );

  final String val;
  final Color color;
  const ToastType(this.val, this.color);
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
