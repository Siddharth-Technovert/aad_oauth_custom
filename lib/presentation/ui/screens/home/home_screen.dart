import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../domain/models/user/user.dart';
import '../../../providers/core/connectivity_provider.dart';
import '../../hooks/app_loc_hook.dart';
import '../../modals/snack_bar/snack_bar_factory.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/custom_text.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = useAppLoc();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: CustomText.headlineSmall(context, appLoc.dashboardScreen),
          elevation: 1,
        ),
        drawer: AppDrawer(
          user: user,
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {},
          selectedIndex: 0,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
          ],
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText.titleLarge(
                  context,
                  appLoc.helloMsg(
                    user.name,
                  ),
                  textAlign: TextAlign.center,
                ),
                Consumer(
                  builder: (context, ref, child) {
                    final connectivityServiceProvider =
                        ref.watch(connectivityStatusProvider);
                    return CustomText.bodyLarge(
                      context,
                      connectivityServiceProvider.when(
                        data: (status) =>
                            "${appLoc.connectivityStatus}: ${status.toString().split(".").last}",
                        error: (ex, _) =>
                            "${appLoc.connectivityStatus}: ${ex.toString()}",
                        loading: () => appLoc.connectivityStatusWait,
                      ),
                      textAlign: TextAlign.center,
                    );
                  },
                ),
                UIDimensions.verticalSpaceMedium,
                FilledButton(
                  onPressed: () {
                    SnackbarFactory.showSuccess(
                      "Success toast",
                    );
                  },
                  child: CustomText.headlineMedium(
                    context,
                    appLoc.toastShow,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
