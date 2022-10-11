import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../core/utils/extensions/context_extension.dart';
import '../../../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../../../shared/presentation/providers/router_provider.dart';
import '../../../../../../shared/presentation/ui/widgets/buttons/primary_button.dart';
import '../../../../../../shared/presentation/ui/widgets/buttons/secondary_outlined_button.dart';
import '../../../providers/home_provider.dart';

class LogoutBottomSheet extends ConsumerWidget {
  const LogoutBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode =
        Theme.of(context).colorScheme.brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: isDarkMode ? const Color(0xff2d2d30) : Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          UIDimensions.verticalSpaceMedium,
          UIDimensions.verticalSpaceSmall,
          Center(
            child: Text(
              'Logout',
              style: context.h3,
            ),
          ),
          UIDimensions.verticalSpaceMedium,
          Center(
            child: SizedBox(
              width: 193,
              child: Text(
                'Are you sure you want to logout from GenNex app ?',
                textAlign: TextAlign.center,
                style: context.h6,
              ),
            ),
          ),
          UIDimensions.verticalSpaceMedium,
          PrimaryButton(
            onPressed: () async {
              ref.read(appRouterProvider).pop();
              ref.read(homeProvider.notifier).logout();
            },
            text: "Logout",
          ),
          UIDimensions.verticalSpaceMedium,
          SecondaryOutlinedButton(
            onPressed: () => ref.read(appRouterProvider).pop(),
            text: "Cancel",
          ),
          UIDimensions.verticalSpaceMedium,
        ],
      ),
    );
  }
}
