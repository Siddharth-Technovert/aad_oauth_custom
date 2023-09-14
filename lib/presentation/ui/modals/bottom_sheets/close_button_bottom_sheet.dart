import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';

class CloseButtonBottomSheet extends StatelessWidget {
  final Widget child;

  const CloseButtonBottomSheet({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(UIDimensions.cardR24),
                child: child,
              ),
              const Positioned(
                // child: Material(
                //   color: Colors.transparent,
                //   shape: const CircleBorder(),
                //   child: UIDimensions.padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: DebouncedButton(
                //       onPressed: () {
                //         Navigator.pop(context);
                //       },
                //       child: UIDimensions.padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: const Icon(
                //           Icons.close,
                //         ),
                //       ),
                //     ),
                //   ),
                child: AutoLeadingButton(),
                // ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
