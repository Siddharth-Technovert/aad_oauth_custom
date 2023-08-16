import 'package:flutter/material.dart';

import 'close_button_bottom_sheet.dart';

abstract class BottomSheetFactory {
  const BottomSheetFactory._();

  static Route<T> closeButtonModalSheetBuilder<T extends Widget>(
    T child,
    RouteSettings routeSettings,
  ) {
    return ModalBottomSheetRoute(
      builder: (context) => CloseButtonBottomSheet(
        child: Material(color: Colors.white, child: child),
      ),
      isScrollControlled: true,
      settings: routeSettings,
    );
  }
}
