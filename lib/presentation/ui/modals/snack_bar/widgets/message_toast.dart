import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../domain/enums/toast_type.dart';
import '../../../hooks/is_dark_mode_hook.dart';
import '../../../widgets/custom_text.dart';

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
      color: useIsDarkHook() ? toastType.darkColor : toastType.lightColor,
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
                    CustomText.headlineSmall(
                      context,
                      title ?? toastType.val,
                    ),
                    UIDimensions.verticalSpace(6),
                    CustomText.titleSmall(
                      context,
                      message,
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
