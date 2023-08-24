import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        // drawer: AppDrawer(
        //   user: user,
        // ),
        // body: Center(
        //   child: SingleChildScrollView(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         CustomText.titleLarge(
        //           context,
        //           appLoc.helloMsg(
        //             user.name,
        //           ),
        //           textAlign: TextAlign.center,
        //         ),
        //         Consumer(
        //           builder: (context, ref, child) {
        //             final connectivityServiceProvider =
        //                 ref.watch(connectivityStatusProvider);
        //             return CustomText.bodyLarge(
        //               context,
        //               connectivityServiceProvider.when(
        //                 data: (status) =>
        //                     "${appLoc.connectivityStatus}: ${status.toString().split(".").last}",
        //                 error: (ex, _) =>
        //                     "${appLoc.connectivityStatus}: ${ex.toString()}",
        //                 loading: () => appLoc.connectivityStatusWait,
        //               ),
        //               textAlign: TextAlign.center,
        //             );
        //           },
        //         ),
        //         UIDimensions.verticalSpaceMedium,
        //         FilledButton(
        //           onPressed: () {
        //             SnackbarFactory.showSuccess(
        //               "Success toast",
        //             );
        //           },
        //           child: CustomText.headlineMedium(
        //             context,
        //             appLoc.toastShow,
        //             textAlign: TextAlign.center,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        );
  }
}
