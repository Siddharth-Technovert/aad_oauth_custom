import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/router/app_router.dart';
import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../domain/states/core/theme_state.dart';
import '../../../providers/core/router_provider.dart';
import '../../../providers/core/theme_state_provider.dart';
import '../../widgets/buttons/primary_button.dart';
import '../../widgets/custom_text.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Consumer(builder: (context, ref, child) {
            final selectedThemeState = ref.watch(themeStateProvider);
            return SwitchListTile(
              contentPadding:
                  UIDimensions.symmetricPaddingGeometry(horizontal: 24),
              title: CustomText.bodyLarge(
                context.appLoc.switchTheme,
              ),
              value: selectedThemeState == const ThemeStateDark(),
              onChanged: (val) async =>
                  ref.read(themeStateProvider.notifier).setThemeState(
                        val ? const ThemeStateDark() : const ThemeStateLight(),
                      ),
            );
          }),
          UIDimensions.verticalSpaceMedium,
          UIDimensions.padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: PrimaryButton(
              onPressed: () => ref.read(appRouterProvider).pushNamed(
                    BottomSheetRouteNames.logOutBottomSheetRoute,
                  ),
              text: context.appLoc.logout,
            ),
          ),
        ],
      ),
    );
  }
}
