import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/utils/styles/ui_helper.dart';
import '../../../../domain/enums/toast_type.dart';
import '../../../../domain/models/user_context/user_context.dart';
import '../../../providers/core/connectivity_provider.dart';
import '../../hooks/app_loc_hook.dart';
import '../../modals/toasts/toast_factory.dart';
import '../../widgets/app_drawer.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({
    Key? key,
    required this.userContext,
  }) : super(key: key);
  final UserContext userContext;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appLoc = useAppLoc();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(appLoc.dashboardScreen),
        ),
        drawer: AppDrawer(
          userContext: userContext,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  appLoc.helloMsg(
                    userContext.displayName ?? appLoc.guest,
                  ),
                  style: Theme.of(context).textTheme.headline6,
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
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 16,
                      ),
                  textAlign: TextAlign.center,
                ),
                UIHelper.verticalSpaceMedium,
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
