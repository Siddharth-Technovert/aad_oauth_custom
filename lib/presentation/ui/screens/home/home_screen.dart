import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../../../domain/enums/toast_type.dart';
import '../../../../domain/models/user/user.dart';
import '../../../providers/core/connectivity_provider.dart';
import '../../hooks/app_loc_hook.dart';
import '../../modals/toasts/toast_factory.dart';
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
                  style: context.h4,
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
                  style: context.bodyText1,
                  textAlign: TextAlign.center,
                ),
                UIDimensions.verticalSpaceMedium,
                ElevatedButton(
                  onPressed: () {
                    ToastFactory.showToast(
                      context,
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
