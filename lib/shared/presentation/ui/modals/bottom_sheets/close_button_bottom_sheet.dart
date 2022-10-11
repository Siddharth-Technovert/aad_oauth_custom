import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../core/utils/styles/colors/colors.dart';
import '../../../providers/router_provider.dart';
import '../../hooks/is_dark_mode_hook.dart';

class CloseButtonBottomSheet extends HookConsumerWidget {
  final Widget child;
  final Animation<double> animation;

  const CloseButtonBottomSheet({
    Key? key,
    required this.child,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = useIsDarkHook();

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  width: double.infinity,
                  child: child,
                ),
              ),
            ),
            Positioned(
              child: AnimatedBuilder(
                animation: animation,
                builder: (context, child) => Transform.translate(
                  offset: Offset(0, (1 - animation.value) * 100),
                  child: Opacity(
                    opacity: max(0, animation.value * 2 - 1),
                    child: child,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        ref.read(appRouterProvider).pop();
                      },
                      style: ButtonStyle(
                        backgroundColor: isDarkMode
                            ? UIColors.dark.button
                            : UIColors.light.button,
                        shape: MaterialStateProperty.all(
                          const CircleBorder(),
                        ),
                        padding: MaterialStateProperty.all(
                          const EdgeInsets.all(12),
                        ),
                      ),
                      child: Icon(
                        Icons.close,
                        color: isDarkMode ? Colors.white : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
