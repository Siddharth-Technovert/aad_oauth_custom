import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../domain/enums/toast_type.dart';

class MessageToast extends HookWidget {
  const MessageToast({
    Key? key,
    this.title,
    required this.message,
    required this.toastType,
    required this.seconds,
  }) : super(key: key);

  final String? title;
  final String message;
  final ToastType toastType;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 8,
      color: toastType.color,
      child: Column(
        children: [
          UIDimensions.verticalSpaceMedium,
          Row(
            children: [
              UIDimensions.horizontalSpaceMedium,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title ?? toastType.val,
                      style: context.h5.copyWith(color: Colors.white),
                    ),
                    UIDimensions.verticalSpace(6),
                    Text(
                      message,
                      style: context.subtitle2.copyWith(color: Colors.white),
                    )
                  ],
                ),
              ),
            ],
          ),
          UIDimensions.verticalSpaceSmall,
        ],
      ),
    );
  }
}
