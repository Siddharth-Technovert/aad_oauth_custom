import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/router/app_router.gr.dart';
import '../../../core/utils/extensions/context_extension.dart';
import '../../../core/utils/styles/colors/colors.dart';
import '../../../domain/models/user/user.dart';
import '../../../domain/states/core/theme/theme_state.dart';
import '../../providers/core/router_provider.dart';
import '../../providers/core/theme_state_provider.dart';
import '../hooks/app_loc_hook.dart';
import '../hooks/is_dark_mode_hook.dart';

class AppDrawer extends HookConsumerWidget {
  const AppDrawer({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = useAppLoc();
    final isDarkMode = useIsDarkHook();
    return Drawer(
      child: Builder(
        builder: (BuildContext buildContext) {
          return ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  gradient: UIColors.primaryGradient,
                ),
                accountName: Text(
                  appLoc.helloMsg(
                    user.name,
                  ),
                  style: context.h3.copyWith(color: Colors.white),
                ),
                accountEmail: const Text(""),
                currentAccountPicture: Container(
                  padding: EdgeInsets.all(
                    user.profileImage != null && user.profileImage!.isNotEmpty
                        ? 2.0
                        : 0.0,
                  ).r,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(40.0).r,
                  ),
                  child: ClipOval(
                    child: user.profileImage != null &&
                            user.profileImage!.isNotEmpty
                        ? Image.network(
                            user.profileImage!,
                            fit: BoxFit.cover,
                          )
                        : Icon(
                            Icons.account_circle,
                            size: 70.0.sm,
                            color: Colors.white,
                          ),
                  ),
                ),
              ),
              SwitchListTile(
                title: Text(
                  appLoc.switchTheme,
                  style: context.h5,
                ),
                value: isDarkMode,
                onChanged: (val) async => ref
                    .read(themeStateProvider.notifier)
                    .setThemeState(
                      val ? const ThemeState.dark() : const ThemeState.light(),
                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0).r,
                child: ElevatedButton(
                  onPressed: () => ref
                      .read(appRouterProvider)
                      .popAndPush(const LogoutBottomSheetRoute()),
                  child: Text(appLoc.logout),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
