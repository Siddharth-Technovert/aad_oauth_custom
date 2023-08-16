import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/utils/styles/colors/colors.dart';

final switchProvider = StateProvider<bool>((ref) => false);

class CustomSwitch extends ConsumerWidget {
  const CustomSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final switchValue = ref.watch(switchProvider);
    return Switch(
      value: switchValue,
      onChanged: (_) {
        ref.read(switchProvider.notifier).state = !switchValue;
      },
      inactiveThumbColor: UIColors.light.switchInactiveTrackColor,
      inactiveTrackColor:
          UIColors.light.switchInactiveTrackColor.withOpacity(0.5),
    );
  }
}
