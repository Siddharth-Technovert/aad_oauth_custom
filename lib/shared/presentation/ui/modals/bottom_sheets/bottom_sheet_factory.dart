import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'close_button_bottom_sheet.dart';

//add close button at top of sheet if needed

abstract class BottomSheetFactory {
  const BottomSheetFactory._();

  //? for all non draggable bottom sheet use this
  static Route<T> modalSheetBuilder<T>(
    BuildContext context,
    Widget child,
    CustomPage<T> page,
  ) {
    return ModalBottomSheetRoute(
      builder: (context) => child,
      containerBuilder: (_, animation, child) => CloseButtonBottomSheet(
        animation: animation,
        child: Wrap(
          children: [Material(child: child)],
        ),
      ),
      settings: page,
      expanded: true,
    );
  }

  //? for draggable bottom sheets create separate builder for each sheet
  static Route<T> rewardModalSheetBuilder<T>(
    BuildContext context,
    Widget child,
    CustomPage<T> page,
  ) {
    return ModalBottomSheetRoute(
      builder: (context) => child,
      containerBuilder: (_, animation, child) => DraggableScrollableSheet(
        minChildSize: 0.5,
        maxChildSize: 0.8,
        snap: true,
        builder: (context, controller) {
          controller.addListener(() {
            if (controller.offset < -120) {
              context.popRoute();
            }
          });
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            controller: controller,
            child: Material(child: child),
          );
        },
      ),
      settings: page,
      expanded: true,
    );
  }
}
