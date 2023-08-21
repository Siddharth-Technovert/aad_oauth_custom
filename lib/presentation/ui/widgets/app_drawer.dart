import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/router/app_router.dart';
import '../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../domain/models/user/user.dart';
import '../../../domain/states/core/theme/theme_state.dart';
import '../../providers/core/router_provider.dart';
import '../../providers/core/theme_state_provider.dart';
import '../hooks/app_loc_hook.dart';
import 'buttons/secondary_button.dart';
import 'custom_text.dart';

class AppDrawer extends HookConsumerWidget {
  const AppDrawer({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = useAppLoc();
    return NavigationDrawer(
      children: [
        UserAccountsDrawerHeader(
          decoration: const BoxDecoration(
              // gradient: UIColors.primaryGradient,
              ),
          accountName: CustomText.displayMedium(
            context,
            appLoc.helloMsg(
              user.name,
            ),
          ),
          accountEmail: CustomText.bodyMedium(context, "guest@gmail.com"),
          currentAccountPicture: Container(
            padding: UIDimensions.allPaddingGeometry(
              user.profileImage != null && user.profileImage!.isNotEmpty
                  ? 2.0
                  : 0.0,
            ),
            child: ClipOval(
              child: user.profileImage != null && user.profileImage!.isNotEmpty
                  ? Image.network(
                      user.profileImage!,
                      fit: BoxFit.cover,
                    )
                  : Icon(
                      Icons.account_circle,
                      size: UIDimensions.iconSize(70.0),
                    ),
            ),
          ),
        ),
        Consumer(builder: (context, ref, child) {
          final selectedThemeState = ref.watch(themeStateProvider);
          return SwitchListTile(
            title: CustomText.bodyLarge(
              context,
              appLoc.switchTheme,
            ),
            value: selectedThemeState == const ThemeState.dark(),
            onChanged: (val) async =>
                ref.read(themeStateProvider.notifier).setThemeState(
                      val ? const ThemeState.dark() : const ThemeState.light(),
                    ),
          );
        }),
        UIDimensions.padding(
          padding: const EdgeInsets.all(16.0),
          child: SecondaryButton(
            onPressed: () => ref.read(appRouterProvider).popAndPushNamed(
                  BottomSheetRouteNames.logOutBottomSheetRoute,
                ),
            text: appLoc.logout,
          ),
        ),
      ],
    );
  }
}
