import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../buttons/primary_button.dart';
import '../custom_text.dart';

class NoConnectionCard extends StatelessWidget {
  const NoConnectionCard({
    required this.onPressed,
    super.key,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: UIDimensions.padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Column(
              children: [
                CustomText.headlineLarge(context.appLoc.noConnection),
                UIDimensions.verticalSpaceMedium,
                CustomText.bodyMedium(
                  context.appLoc.noConnectionMsg,
                  textOverflow: null,
                  textAlign: TextAlign.center,
                )
              ],
            ),
            UIDimensions.verticalSpaceMedium,
            PrimaryButton(
              text: context.appLoc.tryAgain,
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
