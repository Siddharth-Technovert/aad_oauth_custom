import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../domain/enums/toast_type.dart';
import '../../../../domain/models/user/user.dart';
import '../../../providers/core/connectivity_provider.dart';
import '../../hooks/app_loc_hook.dart';
import '../../modals/snack_bar/snack_bar_factory.dart';
import '../../widgets/app_drawer.dart';

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
          title: Text(appLoc.dashboardScreen),
          elevation: 1,
        ),
        drawer: AppDrawer(
          user: user,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  appLoc.helloMsg(
                    user.name,
                  ),
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                Text(
                  ref.watch(connectivityStatusProvider).when(
                        data: (status) =>
                            "${appLoc.connectivityStatus}: ${status.toString().split(".").last}",
                        error: (ex, _) =>
                            "${appLoc.connectivityStatus}: ${ex.toString()}",
                        loading: () => appLoc.connectivityStatusWait,
                      ),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 16,
                      ),
                  textAlign: TextAlign.center,
                ),
                UIDimensions.verticalSpaceMedium,
                ElevatedButton(
                  onPressed: () {
                    SnackbarFactory.showToast(
                      ToastType.info,
                      "This is the info",
                    );
                  },
                  child: Text(
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
