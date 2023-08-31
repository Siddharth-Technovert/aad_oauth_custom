import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../domain/enums/toast_type.dart';
import '../../../widgets/custom_text.dart';

class MessageToast extends StatelessWidget {
  const MessageToast({
    super.key,
    this.title,
    required this.message,
    required this.toastType,
    required this.seconds,
  });

  final String? title;
  final String message;
  final ToastType toastType;
  final int seconds;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      elevation: 8,
      color: context.isDarkMode ? toastType.darkColor : toastType.lightColor,
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
                      title ?? toastType.val,
                    ),
                    UIDimensions.verticalSpace(6),
                    CustomText.titleSmall(
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
