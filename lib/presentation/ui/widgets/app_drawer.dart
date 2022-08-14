import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/router/app_router.gr.dart';
import '../../../core/utils/styles/colors.dart';
import '../../../domain/models/user_context/user_context.dart';
import '../../../domain/states/core/theme/theme_state.dart';
import '../../providers/core/router_provider.dart';
import '../../providers/core/theme_provider.dart';
import '../hooks/app_loc_hook.dart';

class AppDrawer extends HookConsumerWidget {
  const AppDrawer({
    Key? key,
    required this.userContext,
  }) : super(key: key);
  final UserContext userContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = useAppLoc();
    return Drawer(
      child: Builder(
        builder: (BuildContext buildContext) {
          return ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  gradient: UIColors.primaryGradient,
                ),
                accountName: Text(
                  appLoc.helloMsg(
                    userContext.displayName ?? appLoc.guest,
                  ),
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        color: Colors.white,
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                accountEmail: const Text(""),
                currentAccountPicture: Container(
                  padding: EdgeInsets.all(
                    userContext.profileImage != null &&
                            userContext.profileImage!.isNotEmpty
                        ? 2.0
                        : 0.0,
                  ).r,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(40.0).r,
                  ),
                  child: ClipOval(
                    child: userContext.profileImage != null &&
                            userContext.profileImage!.isNotEmpty
                        ? Image.network(
                            userContext.profileImage!,
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
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(fontSize: 18.sp),
                ),
                value: ref.watch(themeProvider) == const ThemeState.dark(),
                onChanged: (val) async => ref
                    .read(themeProvider.notifier)
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
                  child: const Text("Logout"),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
