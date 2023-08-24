import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../widgets/custom_text.dart';

class LandingAppBar extends AppBar {
  LandingAppBar(BuildContext context, {super.key})
      : super(
          toolbarHeight: UIDimensions.height(84),
          title: Row(
            children: [
              Container(
                width: UIDimensions.width(48),
                height: UIDimensions.height(48),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    UIDimensions.radiusCircular(12),
                  ),
                  color: context.customColors.greyColor,
                ),
              ),
              UIDimensions.horizontalSpaceMedium,
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText.bodySmall("Today, 22 Aug, 2023"),
                  CustomText.titleMedium("Good Morning"),
                ],
              ),
            ],
          ),
        );
}
