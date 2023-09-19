import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'close_button_bottom_sheet.dart';

abstract class BottomSheetFactory {
  const BottomSheetFactory._();

  static Route<T> closeButtonModalSheetBuilder<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return ModalBottomSheetRoute<T>(
      builder: (context) => CloseButtonBottomSheet(
        child: Material(child: child),
      ),
      isScrollControlled: true,
      settings: page,
    );
  }
}
