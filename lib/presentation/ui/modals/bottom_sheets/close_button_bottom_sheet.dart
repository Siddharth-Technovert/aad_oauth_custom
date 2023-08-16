import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/styles/colors/colors.dart';
import '../../../../core/utils/styles/decorations/corner_shape_decoration.dart';
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
                borderRadius: smoothBorderRadius(cornerRadius: 24),
                child: child,
              ),
              Positioned(
                child: Material(
                  color: Colors.transparent,
                  shape: const CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0).w,
                    child: DebouncedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0).w,
                        child: Icon(
                          Icons.close,
                          color: UIColors.light.grey,
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
