import 'package:flutter/material.dart';

import '../../../../core/utils/styles/dimensions/ui_dimensions.dart';
import '../../widgets/buttons/debounce_button.dart';

class CloseButtonBottomSheet extends StatelessWidget {
  final Widget child;

  const CloseButtonBottomSheet({
    Key? key,
    required this.child,
  }) : super(key: key);

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
              Positioned(
                child: Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  child: UIDimensions.padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DebouncedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: UIDimensions.padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Icon(
                          Icons.close,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
