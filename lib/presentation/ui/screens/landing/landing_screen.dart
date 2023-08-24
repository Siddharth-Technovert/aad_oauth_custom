import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../home/home_screen.dart';
import '../profile/profile_screen.dart';
import 'widget/landing_app_bar.dart';

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
    final index = ref.watch(landingScreenIndexProvider);
    // final indexController = useTabController(initialLength: 2);
    return SafeArea(
      child: Scaffold(
        appBar: LandingAppBar(context),
        // body: TabBarView(
        //   controller: indexController,
        //   children: const [HomeScreen(), ProfileScreen()],
        // ),
        body: const [HomeScreen(), ProfileScreen()][index],
        bottomNavigationBar: NavigationBar(
          // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          animationDuration: const Duration(seconds: 1),
          onDestinationSelected: (int index) {
            ref
                .read(landingScreenIndexProvider.notifier)
                .update((state) => index);

            // indexController.index = index;
          },
          selectedIndex: index,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
