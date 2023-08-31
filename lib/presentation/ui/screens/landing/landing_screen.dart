import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/extensions/context_extension.dart';
import '../home/home_screen.dart';
import '../profile/profile_screen.dart';

final landingScreenIndexProvider = StateProvider.autoDispose<int>(
  (ref) {
    return 0;
  },
  name: "LandingScreenIndexProvider",
);

class LandingScreen extends ConsumerWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(landingScreenIndexProvider);
    // final indexController = useTabController(initialLength: 2);
    //? Using annotated region here only for the reason as when scaffold not having app bar set, the status bar color will not change
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: context.theme.appBarTheme.systemOverlayStyle!,
      child: Scaffold(
        // body: TabBarView(
        //   controller: indexController,
        //   children: const [HomeScreen(), ProfileScreen()],
        // ),
        body: SafeArea(
          child: IndexedStack(
            index: currentIndex,
            children: const [HomeScreen(), ProfileScreen()],
          ),
        ),
        bottomNavigationBar: NavigationBar(
          // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          animationDuration: const Duration(seconds: 1),
          onDestinationSelected: (int index) {
            ref
                .read(landingScreenIndexProvider.notifier)
                .update((state) => index);

            // indexController.index = index;
          },
          selectedIndex: currentIndex,
          destinations: <Widget>[
            NavigationDestination(
              selectedIcon: const Icon(Icons.home),
              icon: const Icon(Icons.home_outlined),
              label: context.appLoc.home,
            ),
            NavigationDestination(
              icon: const Icon(Icons.settings),
              label: context.appLoc.settings,
            ),
          ],
        ),
      ),
    );
  }
}
